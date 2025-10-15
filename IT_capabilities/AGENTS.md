# Repository Guidelines

## Project Structure & Module Organization
- Source: domain folders at the root (e.g., `02_IT_Management`, `03_Banking_Financial_Markets_Operations`, `04_Customer_Distribution_Channels`, `05_Marketing_Sales`).
- Content: nested subfolders by capability, containing standalone `.html` documents. Example: `03_Banking_Financial_Markets_Operations/Product_Management/Product_Fulfillment/CRM-Autosweep---REST-API_17342633.html`.
- Assets: this repo is HTML-only; no JS/CSS assets or build system.

## Build, Test, and Development Commands
- Local preview: `python3 -m http.server 8080` from repo root, then open the target HTML path in your browser.
- Search content: `rg "keyword" 03_Banking_Financial_Markets_Operations` (use `grep -R` if `rg` is unavailable).
- Validate HTML (optional): use a local HTML validator (e.g., `tidy -e file.html`) or an offline validator to check for structural issues.

## Coding Style & Naming Conventions
- Format: 2-space indentation, UTF-8 encoding, lines ~120 chars max.
- Filenames: keep the existing pattern `Title---Channel_or_Type_<ID>.html` under the appropriate domain/subdomain. Do not rename existing files unless required.
- Directories: use the established domain → subdomain hierarchy; prefer underscores in folder names as already present.
- Links: use relative paths; avoid external scripts or trackers.

## Testing Guidelines
- Rendering: open changed HTML files in a browser; verify headings, tables, and diacritics render correctly.
- Links: check all internal links resolve within the repo tree.
- Validation: ensure no unclosed tags; run an HTML validator for non-trivial changes.

## Commit & Pull Request Guidelines
- Commits: concise, imperative subject (English or Czech acceptable). Example: "Update Product_Fulfillment docs: autosweep REST API".
- Scope: reference affected directories (e.g., `03_Banking_Financial_Markets_Operations/Product_Management/...`).
- PRs: include a summary, list of changed files, before/after screenshots for visual sections, and any related issue links. Keep diffs focused; avoid unrelated reformatting.

## Security & Content Hygiene
- No secrets or personal data in HTML.
- Keep documents self-contained; avoid embedding third-party code.
- Large media files are out of scope for this repo.

