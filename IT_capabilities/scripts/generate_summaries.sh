#!/usr/bin/env bash
set -euo pipefail

# Generate SUMMARY.md files for each directory that directly contains .html files.
# Heuristics:
# - Type: filename contains 'REST-API' => API; 'Event-Stream' => EI Topic; else Other
# - Title: from <title>; fallback to filename
# - Endpoints: strip HTML, extract lines like GET/POST/... /path
# - Data objects: first path segment(s) from endpoints
# - Impacted systems: scan content for known systems (WSO2, Kafka, CRM, ECB, SAP, ESB, Magnus, PersonalBanker)
# - Description: first sentence from first <p> block (best-effort)

root_dir="${1:-.}"

shopt -s nullglob

is_leaf_with_html() {
  local dir="$1"
  ls -1A "$dir"/*.html >/dev/null 2>&1 || return 1
  # Consider it a target if it has at least one HTML file directly inside
  return 0
}

strip_html() {
  # best-effort strip of tags and entities
  sed -E 's/<[^>]+>/\n/g' | sed -E 's/&nbsp;/ /g; s/&amp;/\&/g' | awk 'NF'
}

extract_title() {
  local file="$1"
  local t
  t=$(sed -n 's:.*<title>\(.*\)</title>.*:\1:p' "$file" | head -n1)
  if [[ -z "$t" ]]; then
    basename "$file"
  else
    echo "$t"
  fi
}

extract_description() {
  local file="$1"
  # grab first non-empty paragraph-ish text and return first sentence (~200 chars)
  local text
  text=$(awk '1' "$file" | strip_html | awk 'NF' | head -n 50 | tr '\n' ' ')
  # take up to first period or 200 chars
  if [[ -n "$text" ]]; then
    echo "$text" | sed -E 's/ {2,}/ /g' | sed -E 's/^ +| +$//g' | awk '{print substr($0,1,300)}'
  fi
}

extract_endpoints() {
  local file="$1"
  awk '1' "$file" | strip_html \
    | grep -Eo '\b(GET|POST|PUT|DELETE|PATCH)\b[[:space:]]+/[A-Za-z0-9_\-\./{}?=&,:]+' \
    | sed -E 's/[[:space:]]+/ /g; s/\{ *\}/\{\}/g; s/[[:space:]]+$//' \
    | sort -u
}

extract_data_objects() {
  # Derive from endpoints first path segment (strip query and braces)
  sed -E 's/^(GET|POST|PUT|DELETE|PATCH)[[:space:]]+([^[:space:]]+).*/\2/' \
    | sed -E 's/\?.*$//' \
    | sed -E 's#^/##' \
    | cut -d'/' -f1 \
    | sed -E 's/[{}]//g; s/[^A-Za-z0-9_-]//g' \
    | awk 'NF' \
    | sort -u
}

extract_systems() {
  local file="$1"
  awk '1' "$file" | strip_html | grep -Eio '\b(WSO2|Kafka|CRM|ECB|SAP|ESB|Confluence|Magnus|PersonalBanker)\b' | sort -u
}

create_summary_for_dir() {
  local dir="$1"
  local out="$dir/SUMMARY.md"
  echo "# Directory Summary: ${dir#./}" > "$out"
  echo >> "$out"

  for f in "$dir"/*.html; do
    [[ -e "$f" ]] || continue
    local base type title desc
    base=$(basename "$f")
    if [[ "$base" == *"Event-Stream"* || "$base" == *"Event-stream"* || "$base" == *"Event_stream"* ]]; then
      type="EI Topic"
    elif [[ "$base" == *"REST-API"* || "$base" == *"REST_API"* || "$base" == *"REST"* ]]; then
      type="API"
    else
      type="API/Topic"
    fi
    title=$(extract_title "$f")
    desc=$(extract_description "$f" || true)
    endpoints="$(extract_endpoints "$f" || true)"
    systems="$(extract_systems "$f" || true)"
    # data objects from endpoints
    data_objs=$(printf '%s\n' "$endpoints" | extract_data_objects || true)

    echo "## ${title}" >> "$out"
    echo "- Type: ${type}" >> "$out"
    if [[ "$type" == "API" ]]; then
      if [[ -n "${endpoints:-}" ]]; then
        echo "- API: endpoints" >> "$out"
        while IFS= read -r e; do
          [[ -n "$e" ]] && echo "  - $e" >> "$out"
        done <<< "$endpoints"
      else
        echo "- API: endpoints not detected" >> "$out"
      fi
    else
      # EI Topic or mixed
      # Try to list topic-like tokens (heuristic: words containing 'topic' or from title)
      topics=$(awk '1' "$f" | strip_html | grep -Eio '\b[[:alnum:]_-]*topic[[:alnum:]_-]*\b' | sort -u | tr '\n' ', ' | sed 's/, $//') || true
      if [[ -n "${topics:-}" ]]; then
        echo "- EI topics: ${topics}" >> "$out"
      else
        # fallback to title keyword
        echo "- EI topics: $(echo "$title" | sed -E 's/Enterprise Integration *: *//')" >> "$out"
      fi
    fi
    if [[ -n "$data_objs" ]]; then
      echo "- Data objects: $(echo "$data_objs" | tr '\n' ', ' | sed 's/, $//')" >> "$out"
    else
      # fallback from title
      echo "- Data objects: $(echo "$title" | sed -E 's/.*: *//; s/ - .*//')" >> "$out"
    fi
    if [[ -n "${systems:-}" ]]; then
      echo "- Impacted systems: $(echo "$systems" | tr '\n' ', ' | sed 's/, $//')" >> "$out"
    else
      echo "- Impacted systems: not specified" >> "$out"
    fi
    if [[ -n "${desc:-}" ]]; then
      echo "- Description: ${desc}" >> "$out"
    fi
    echo >> "$out"
  done
}

# Traverse directories
while IFS= read -r -d '' d; do
  if is_leaf_with_html "$d"; then
    create_summary_for_dir "$d"
  fi
done < <(find "$root_dir" -type d -print0)

echo "Done. Summaries created where applicable."
