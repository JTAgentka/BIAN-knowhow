# {{PROJECT_TITLE}}
**Projektová Definice a Analýza**

---

## Metadata Projektu

| Položka | Hodnota |
|---------|---------|
| **ID Projektu** | {{PROJECT_ID}} |
| **Datum Vytvoření** | {{CREATION_DATE}} |
| **Status** | {{PROJECT_STATUS}} |
| **Verze Dokumentu** | {{DOCUMENT_VERSION}} |
| **Session ID** | {{SESSION_ID}} |

---

## 1. Exekutivní Shrnutí

### Přehled Projektu
{{EXECUTIVE_SUMMARY}}

### Klíčové Metriky
- **Identifikovaných Stakeholderů:** {{STAKEHOLDER_COUNT}}
- **Dokončených Fází:** {{PHASES_COMPLETED}}
- **Kritérií Úspěchu:** {{SUCCESS_CRITERIA_COUNT}}

### Klíčové Výsledky
{{KEY_OUTCOMES}}

---

## 2. Matice Zapojení Stakeholderů

Následující tabulka představuje komplexní analýzu všech identifikovaných stakeholderů projektu, jejich rolí, cílů a strategií zapojení.

| Stakeholder | Role | Cíle | Postoj | Vliv | Zájem | Strategie Zapojení |
|-------------|------|------|--------|------|-------|-------------------|
{{STAKEHOLDER_TABLE_ROWS}}

---

## 3. Definice Problému a Motivace

### Business Bolesti
{{BUSINESS_PAIN}}

### Motivace ke Změně
{{CHANGE_MOTIVATION}}

### Cíle Vysoké Úrovně
{{HIGH_LEVEL_OBJECTIVES}}

### Kritéria Úspěchu
{{SUCCESS_CRITERIA}}

---

## 4. Rozsah Projektu

### Zahrnuto do Rozsahu (Scope In)
{{SCOPE_IN_ITEMS}}

### Vyloučeno z Rozsahu (Scope Out)
{{SCOPE_OUT_ITEMS}}

### Předpoklady
{{ASSUMPTIONS}}

### Omezení
{{CONSTRAINTS}}

---

## 5. Analýza Současného Stavu

### Současné Procesy
{{CURRENT_PROCESSES}}

### Systémová Krajina
{{SYSTEM_LANDSCAPE}}

### Definice Rolí
{{ROLE_DEFINITIONS}}

### Problémové Oblasti
{{PROBLEM_AREAS}}

### Hodnocení Rizik

| Riziko | Priorita | Popis |
|--------|----------|-------|
{{RISK_ASSESSMENT_ROWS}}

---

## 6. Návrh Cílového Stavu + Gap Analýza

### Cílový Model

#### Procesní Diagramy
{{TO_BE_PROCESSES}}

#### Systémová Architektura
{{TO_BE_ARCHITECTURE}}

#### Definice Rolí
{{TO_BE_ROLES}}

#### Datové Toky
{{TO_BE_DATA_FLOWS}}

### Gap Analýza

| Dimenze | Současný Stav | Cílový Stav | Popis Gap | Úroveň Dopadu | Priorita |
|---------|---------------|-------------|-----------|---------------|----------|
{{GAP_ANALYSIS_ROWS}}

---

## 7. Hodnocení Dopadu na Data a Systémy

### Hodnocení Dopadu na Data

| Datový Element | Současný Vlastník | Nový Vlastník | Citlivost | Změny Přístupu | Dopad na Lineage |
|----------------|-------------------|---------------|-----------|----------------|------------------|
{{DATA_IMPACT_ROWS}}

### Matice Dopadu na Systémy

| Systém/Aplikace | Typ Dopadu | Požadovaná Modifikace | Změny Integrace | Úroveň Rizika |
|-----------------|------------|----------------------|-----------------|---------------|
{{SYSTEM_IMPACT_ROWS}}

### Požadavky na Integraci
{{INTEGRATION_REQUIREMENTS}}

---

## 8. Kritéria Akceptace

Následující SMART kritéria definují měřitelné požadavky pro úspěšné dokončení projektu.

| ID Kritéria | Popis | Specifické | Měřitelné | Dosažitelné | Relevantní | Časově Vázané | Metoda Validace |
|-------------|-------|------------|-----------|-------------|------------|---------------|-----------------|
{{ACCEPTANCE_CRITERIA_ROWS}}

---

## 9. Přílohy

### Podpůrné Poznámky
{{SUPPORTING_NOTES}}

### Glosář

| Termín | Definice |
|--------|----------|
{{GLOSSARY_ROWS}}

### Reference
{{REFERENCES}}

### Metadata Projektu
- **Session ID:** {{SESSION_ID}}
- **Datum Analýzy:** {{ANALYSIS_DATE}}
- **Použité Nástroje:** Claude Code Project Definition Workflow
- **Soubory Kontextu:**
  - Controller Context: {{CONTROLLER_CONTEXT_FILE}}
  - Facilitator Context: {{FACILITATOR_CONTEXT_FILE}}
  - Consolidator Context: {{CONSOLIDATOR_CONTEXT_FILE}}
  - Finalizer Context: {{FINALIZER_CONTEXT_FILE}}

---

*Vygenerováno pomocí Claude Code Project Definition Workflow*  
*Datum: {{GENERATION_DATE}} | Verze: {{DOCUMENT_VERSION}}*