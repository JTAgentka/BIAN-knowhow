# Systém Správy Dotazníků
**Projektová Definice a Analýza**

---

## Metadata Projektu

| Položka | Hodnota |
|---------|---------|
| **ID Projektu** | QUESTIONNAIRE-ADMIN-2024 |
| **Datum Vytvoření** | 11. září 2025 |
| **Status** | SCHVÁLENO |
| **Verze Dokumentu** | v1.0 |
| **Session ID** | QUESTIONNAIRE-ADMIN-2024-SESSION |

---

## 1. Exekutivní Shrnutí

### Přehled Projektu
Strategická iniciativa pro vytvoření centralizovaného webového systému správy šablon dotazníků. Projekt si klade za cíl dosáhnout 80% snížení času potřebného k vytvoření šablony a 90% snížení manuálních chyb prostřednictvím investice do centralizované webové administrační platformy s integrací do Active Directory pro zvýšení operační efektivity a dodržování compliance požadavků.

### Klíčové Metriky
- **Identifikovaných Stakeholderů:** 9
- **Dokončených Fází:** 11
- **Kritérií Úspěchu:** 5

### Klíčové Výsledky
- ✅ Dokument projektové definice v1.0 - 48 stran - Schválen orgány správy
- ✅ Matice zapojení stakeholderů - 9 stakeholderů zmapováno se strategiemi zapojení
- ✅ Komplexní analýza požadavků - Definice problému, rozsah, as-is analýza, to-be návrh
- ✅ Hodnocení dopadů - Analýza dat a systémů s požadavky na integraci
- ✅ SMART kritéria akceptace - 5 měřitelných kritérií s metodami validace
- ✅ Hodnocení rizik a plány mitigace - Komplexní analýza rizik
- ✅ Balíček pro schválení správou - Exekutivní prezentace, požadavky na zdroje, časový plán

---

## 2. Matice Zapojení Stakeholderů

Následující tabulka představuje komplexní analýzu všech identifikovaných stakeholderů projektu, jejich rolí, cílů a strategií zapojení.

| Stakeholder | Role | Cíle | Postoj | Vliv | Zájem | Strategie Zapojení |
|-------------|------|------|--------|------|-------|-------------------|
| Business Uživatelé/Vlastníci | Primární Koncoví Uživatelé | Efektivní správa šablon, jednoduché editace, verzování | Podporující | Vysoký | Vysoký | Aktivní spolupráce, pravidelné feedback sessions, účast v UAT |
| Admin Uživatelé | Administrace Systému | Bezpečný přístup založený na rolích, AD integrace, správa uživatelů | Podporující | Střední | Vysoký | Validace požadavků, bezpečnostní review, plánování školení |
| Koncoví Klienti | Příjemci Dotazníků | Jednoduché, intuitivní dotazníkové prostředí | Neutrální | Nízký | Střední | Feedback uživatelského prostředí prostřednictvím business uživatelů |
| IT Vývojový Tým | Technická Implementace | Škálovatelná architektura, udržovatelný kód, integrační schopnosti | Podporující | Vysoký | Vysoký | Technické workshopy, review architektury, plánování implementace |
| Security/Compliance Tým | Dohled nad Přístupovými Právy | Compliance AD integrace, bezpečnost založená na rolích, audit trail | Opatrný | Střední | Vysoký | Review bezpečnostních požadavků, validace compliance |
| Týmy Interních Systémů | Integračních Partneři | Bezproblémová iframe integrace, kompatibilita API | Neutrální až Podporující | Střední | Střední | Získávání integračních požadavků, technická koordinace |
| Audit Tým | Monitoring Compliance | Kompletní audit trail, sledování verzí, logování změn | Podporující | Nízký | Střední | Definice auditních požadavků, hodnocení reportovacích potřeb |
| Quality Assurance Tým | Testování a Validace | Komplexní testovací pokrytí, bezchybné dodání | Podporující | Střední | Střední | Plánování testů, definice kritérií akceptace |
| Business Analytici | Most mezi Požadavky | Jasné požadavky, sladění stakeholderů | Podporující | Střední | Vysoký | Získávání požadavků, dokumentace, validační workshopy |

---

## 3. Definice Problému a Motivace

### Business Bolesti
⚠️ **Manuální procesy správy dotazníků, problémy s verzováním, omezené nástroje pro spolupráci, nekonzistentní řízení přístupu, nedostatečné auditní schopnosti, mezery v integraci a operační neefektivnost v řízení životního cyklu šablon.**

### Motivace ke Změně
Iniciativa digitální transformace pro přechod od manuální k automatizované správě dotazníků, zlepšení operační efektivity, splnění compliance požadavků, vylepšení uživatelského prostředí a umožnění bezproblémové systémové integrace.

### Cíle Vysoké Úrovně
- ✅ **Zefektivnit správu šablon** - Poskytnout komplexní CRUD operace pro šablony dotazníků
- ✅ **Implementovat řízení verzí** - Umožnit správné verzování s možnostmi publikování/ukrytí
- ✅ **Vylepšit uživatelské prostředí** - Vytvořit intuitivní admin rozhraní pro business uživatele
- ✅ **Zajistit bezpečnost a compliance** - Implementovat přístup založený na rolích s AD integrací
- ✅ **Umožnit systémovou integraci** - Podpořit iframe integraci s interními systémy
- ✅ **Poskytovat auditní schopnosti** - Komplexní logování a sledování změn

### Kritéria Úspěchu
✅ **Operační:** 80% snížení času vytváření šablon, 90% snížení manuálních chyb, 100% pokrytí audit trail

✅ **Spokojenost uživatelů:** 95% skóre spokojenosti uživatelů, 100% uživatelů vyškoleno do 1 hodiny

✅ **Technické:** 99,5% dostupnost, <2s časy odezvy, úspěšná integrace se všemi interními systémy

✅ **Compliance:** 100% compliance AD integrace, kompletní implementace přístupu založeného na rolích, plný audit trail

---

## 4. Rozsah Projektu

### Zahrnuto do Rozsahu (Scope In)
- ✅ Admin webové prostředí pro business uživatele
- ✅ Systém správy šablon - Kompletní CRUD operace
- ✅ Správa struktury šablon - Sekce, otázky, odpovědi, řídící otázky
- ✅ Správa metadat šablon - Typ, jazyk, verze, metadata
- ✅ Systém řízení verzí - Publikované/nepublikované stavy
- ✅ Operace se šablonami - Preview, kopírování, export, editace
- ✅ Správa verzí - Možnost zneplatnit předchozí verze
- ✅ Sledování změn - Uživatelský changelog, porovnání verzí
- ✅ Řízení přístupu - Přístup založený na rolích s AD integrací
- ✅ Funkční moduly - Správa klientů, dotazníků, audit obrazovky
- ✅ Systémová integrace - Schopnost iframe integrace
- ✅ Audit trail - Komplexní logování a sledování všech aktivit

### Vyloučeno z Rozsahu (Scope Out)
- ❌ Vývoj algoritmů - Žádný dopad na existující evaluační algoritmy
- ❌ Uživatelské rozhraní dotazníků - Pouze admin rozhraní
- ❌ Sběr odpovědí dotazníků - Bez zpracování skutečných odpovědí
- ❌ Analýza dat/reportování - Bez pokročilé analytiky dat dotazníků
- ❌ Mobilní aplikace - Pouze webové řešení
- ❌ Integrace třetích stran - Kromě specifikovaných interních systémů
- ❌ Pokročilý workflow engine - Bez komplexních schvalovacích workflow
- ❌ Správa vícejazyčného obsahu - Pouze metadata podporují jazyk
- ❌ Real-time spolupráce - Bez současného editování
- ❌ Pokročilý designer šablon - Základní struktura, ne drag-and-drop

### Předpoklady
- ✅ Infrastruktura Active Directory je dostupná a přístupná pro integraci
- ✅ Cílová infrastruktura pro nasazení je dostupná a specifikovaná
- ✅ Koncoví uživatelé používají moderní webové prohlížeče
- ✅ API/rozhraní pro iframe integraci jsou dokumentovány a dostupné
- ✅ Vhodná databázová infrastruktura je dostupná pro nasazení
- ✅ Business uživatelé jsou dostupní pro validaci požadavků a školení
- ✅ Existující šablony dotazníků lze identifikovat a strukturovat pro migraci
- ✅ Business pravidla a validační logika dotazníků jsou zdokumentovány
- ✅ Proces schvalování změn šablon je definován
- ✅ Zdroje pro průběžnou údržbu a podporu budou alokovány

### Omezení
⚠️ **Technická:** Musí se integrovat s existující AD, podporovat iframe embedding, splnit kompatibilitu prohlížečů, dosáhnout <2s časů odezvy, dodržet bezpečnostní politiky.

⚠️ **Business:** Projekt musí být dodán v rámci rozpočtu a časových omezení, omezená dostupnost uživatelů, zavedený proces řízení změn, požadavky regulatorní compliance.

⚠️ **Operační:** Omezená okna pro nasazení, minimální přijatelné výpadky, žádná ztráta dat během implementace, udržet produktivitu uživatelů během přechodu.

---

## 5. Analýza Současného Stavu

### Současné Procesy
- ❌ **Manuální tvorba šablon** - Business uživatelé vytvářejí šablony pomocí Word/Excel bez standardizované struktury
- ❌ **Správa verzí založená na souborech** - Manuální verzování s nekonzistentními konvencemi pojmenování
- ❌ **Distribuce šablon emailem** - Manuální kopírování a distribuce do více systémů
- ❌ **Ad-hoc správa změn** - Žádný formální proces žádostí o změnu nebo analýza dopadů
- ❌ **Základní řízení přístupu** - Oprávnění souborového systému s omezeným audit trail

### Systémová Krajina
- 📁 **Systém úložiště souborů** - Síťové disky nebo SharePoint pro úložiště šablon
- 📧 **Emailový systém** - Primární komunikace a metoda distribuce
- 📄 **Kancelářské aplikace** - Word/Excel pro tvorbu a editaci šablon
- 🔐 **Active Directory** - Systém autentizace uživatelů (dostupný pro integraci)
- 🏢 **Interní business systémy** - Různé systémy vyžadující integraci dotazníků
- 🗄️ **Základní databázové systémy** - Omezené schopnosti úložiště dat dotazníků

### Definice Rolí
- 👤 **Business Uživatelé/Vlastníci Šablon** - Vytvářejí, udržují, kontrolují a distribuují šablony dotazníků
- 🔧 **IT Podpůrný Personál** - Spravuje úložiště souborů, přístupová oprávnění a poskytuje technickou podporu
- 👥 **Koncoví Uživatelé/Klienti** - Přijímají, vyplňují a vrací dotazníky manuálně
- 📋 **Audit/Compliance Personál** - Manuálně sleduje verze, kontroluje procesy, zajišťuje compliance

### Problémové Oblasti
⚠️ **Chaos v řízení verzí** - Více verzí v oběhu, nejasná autoritativní verze

⚠️ **Neefektivnost manuálních procesů** - Časově náročné vytváření, manuální distribuce, vysoké riziko chyb

⚠️ **Omezená spolupráce** - Bez strukturované spolupráce, neefektivní kontroly založené na emailu

⚠️ **Problémy s bezpečností a přístupem** - Nekonzistentní řízení přístupu, omezený audit trail

⚠️ **Výzvy integrace** - Manuální zadávání dat, nekonzistentní formáty, omezená synchronizace

⚠️ **Omezení škálovatelnosti** - Proces neškáluje s růstem, náročná správa zdrojů

### Hodnocení Rizik

| Riziko | Priorita | Popis |
|--------|----------|-------|
| Compliance riziko | VYSOKÁ | Nedostatečný audit trail a řízení verzí |
| Operační riziko | VYSOKÁ | Manuální procesy náchylné k chybám a zpoždením |
| Bezpečnostní riziko | VYSOKÁ | Neřízený přístup a omezená autentizace |
| Riziko kontinuity podnikání | VYSOKÁ | Závislost na manuálních procesech |
| Integrační riziko | STŘEDNÍ | Obtížné propojení s business systémy |
| Škálovatelnosti riziko | STŘEDNÍ | Současné procesy nepodpoří růst |
| Riziko spokojenosti uživatelů | STŘEDNÍ | Neefektivní nástroje způsobující frustraci |

---

## 6. Návrh Cílového Stavu + Gap Analýza

### Cílový Model

#### Procesní Diagramy
- ✅ **Centralizovaný proces správy šablon** - Jednotný webový admin portál se strukturovaným workflow
- ✅ **Správa životního cyklu šablon** - Tvorba pomocí formulářového rozhraní s preview a validací
- ✅ **Proces spolupráce a kontroly** - Multi-uživatelské editace s changelog a schvalovacím workflow
- ✅ **Integrace a distribuce** - Automatizovaná iframe integrace s API-založenou výměnou dat

#### Systémová Architektura
- 🖥️ **Frontend vrstva** - React-založená admin webová aplikace s responzivním designem
- ⚙️ **Backend služby** - RESTful API služby s AD autentizací a audit logováním
- 🗄️ **Datová vrstva** - Centralizovaná databáze s verzováním a správou metadat
- 🔗 **Integrační vrstva** - Schopnost iframe embedding s API gateway a notifikacemi

#### Definice Rolí
- 👨‍💼 **Administrátor šablon** - Plný CRUD přístup, správa uživatelů, konfigurace systému
- 📝 **Vlastník šablon** - Vytváření, editace a správa vlastněných šablon, schvalování změn
- ✏️ **Editor šablon** - Vytváření a editace šablon, předložení ke schválení
- 👁️ **Prohlížeč šablon** - Přístup pouze pro čtení k publikovaným šablonám, možnosti exportu
- 🔍 **Systémový auditor** - Přístup k audit logům a compliance reportům

#### Datové Toky
- ➡️ **Tok tvorby šablon** - Uživatelský vstup → Strukturovaný formulář → Validace → Uložení do databáze
- 🔄 **Tok správy verzí** - Změny šablon → Vytvoření verze → Schválení → Publikování
- 🔗 **Integrační tok** - Data šablon → API služby → iframe integrace → Interní systémy
- 📋 **Audit tok** - Všechny systémové aktivity → Audit služba → Compliance databáze → Reporty

### Gap Analýza

| Dimenze | Současný Stav | Cílový Stav | Popis Gap | Úroveň Dopadu | Priorita |
|---------|---------------|-------------|-----------|---------------|----------|
| Proces | Manuální tvorba šablon ve Word/Excel | Webová strukturovaná tvorba šablon | Potřeba kompletního redesignu procesu a školení uživatelů | VYSOKÁ | 1 |
| Systém | Úložiště založené na souborech s emailovou distribucí | Centralizovaná webová aplikace s API integrací | Potřeba vývoje nového systému a migrace dat | VYSOKÁ | 1 |
| Data | Nestrukturované soubory s manuálním verzováním | Strukturovaná databáze s automatizovaným verzováním | Potřeba návrhu databáze a migrační strategie | VYSOKÁ | 2 |
| Role | Neformální role založené na oprávněních souborů | Formální řízení přístupu založené na rolích s AD integrací | Integrace správy identit a definice rolí | STŘEDNÍ | 2 |
| Integrace | Manuální zadávání dat mezi systémy | Automatizovaná iframe a API integrace | Potřeba vývoje a testování integrace | STŘEDNÍ | 3 |
| Audit | Omezené manuální sledování | Komplexní automatizovaný audit trail | Vývoj audit systému a validace compliance | STŘEDNÍ | 3 |
| Spolupráce | Kontroly a změny založené na emailu | Vestavěné nástroje spolupráce | Vývoj workflow engine a notifikačního systému | NÍZKÁ | 4 |

---

## 7. Hodnocení Dopadu na Data a Systémy

### Hodnocení Dopadu na Data

| Datový Element | Současný Vlastník | Nový Vlastník | Citlivost | Změny Přístupu | Dopad na Lineage |
|----------------|-------------------|---------------|-----------|----------------|------------------|
| Šablony dotazníků | Individuální business uživatelé | Systém správy šablon | STŘEDNÍ | Centralizovaný přístup s oprávněními založenými na rolích | Kompletní migrace ze souborů do databáze |
| Metadata šablon | Manuální vlastnosti souborů | Systém správy metadat | NÍZKÁ | Strukturovaná metadata s automatizovanou správou | Nové schéma metadat a validace |
| Historie verzí | Manuální pojmenování souborů | Automatizované řízení verzí | STŘEDNÍ | Systémově spravované verzování s audit trail | Potřeba rekonstrukce historických verzí |
| Data přístupu uživatelů | Oprávnění souborového systému | Integrace Active Directory | VYSOKÁ | RBAC s AD autentizací | Integrace s existující AD infrastrukturou |
| Audit logy | Omezené manuální logy | Komplexní audit systém | VYSOKÁ | Automatizované logování s compliance reportováním | Nová struktura audit dat a uchovávání |

### Matice Dopadu na Systémy

| Systém/Aplikace | Typ Dopadu | Požadovaná Modifikace | Změny Integrace | Úroveň Rizika |
|-----------------|------------|----------------------|-----------------|---------------|
| Active Directory | Integrace | Konfigurační změny pro RBAC | Nové autentizační toky a správa skupin | STŘEDNÍ |
| Interní business systémy | Integrace | Podpora iframe embedding | API koncové body pro výměnu dat šablon | VYSOKÁ |
| Úložiště souborů (SharePoint/Network) | Nahrazení | Migrace dat a vyřazení z provozu | Migrace obsahu šablon do nového systému | STŘEDNÍ |
| Databázová infrastruktura | Nová komponenta | Nasazení nové databáze | Systémy úložiště dat šablon a auditu | VYSOKÁ |
| Platforma webových aplikací | Nová komponenta | Nasazení frontend a backend | Kompletní nový stack webové aplikace | VYSOKÁ |

### Požadavky na Integraci
- 🔴 **VYSOKÁ PRIORITA:** Active Directory autentizace - LDAP/SAML integrace, mapování rolí založené na skupinách, implementace SSO
- 🔴 **VYSOKÁ PRIORITA:** Iframe integrace interních systémů - Bezpečné embedding, konfigurace CORS, předávání autentizačních tokenů
- 🔴 **VYSOKÁ PRIORITA:** Databázová integrace - Repository šablon, schéma řízení verzí, implementace audit trail
- 🟡 **STŘEDNÍ PRIORITA:** Email/notifikační systém - SMTP integrace, šablonové emaily, správa preferencí
- 🟡 **STŘEDNÍ PRIORITA:** Migrace souborového systému - Automatizované migrační utility, import legacy, validace obsahu
- 🟢 **NÍZKÁ PRIORITA:** Reportování a analytika - Analytika využití, monitoring výkonu, compliance reportování
- 🟢 **NÍZKÁ PRIORITA:** Backup a obnova - Integrace zálohování databáze, disaster recovery, politiky uchovávání dat

---

## 8. Kritéria Akceptace

Následující SMART kritéria definují měřitelné požadavky pro úspěšné dokončení projektu.

| ID Kritéria | Popis | Specifické | Měřitelné | Dosažitelné | Relevantní | Časově Vázané | Metoda Validace |
|-------------|-------|------------|-----------|-------------|------------|---------------|-----------------|
| AC001 | CRUD operace šablon - Admin uživatelé mohou vytvářet, číst, upravovat, mazat šablony dotazníků prostřednictvím webového rozhraní | ✅ Ano | Úspěšnost >95% pro všechny CRUD operace | ✅ Ano - standardní webový vývoj | ✅ Ano - klíčová funkcionalita | Datum spuštění | User acceptance testování s business uživateli |
| AC002 | Systém řízení verzí - Systém automaticky vytvoří novou verzi při úpravě šablony s kompletním sledováním historie | ✅ Ano | 100% úprav vytvoří novou verzi, 0% ztráta verzí | ✅ Ano - databázové verzování | ✅ Ano - compliance požadavek | Datum spuštění | Automatizované testování + manuální validace |
| AC003 | Řízení přístupu založené na rolích - AD-integrovaná autentizace s 5 definovanými rolemi a příslušnými oprávněními | ✅ Ano | 100% AD integrace, všech 5 rolí funkčních | ✅ Ano - existující AD infrastruktura | ✅ Ano - bezpečnostní požadavek | Datum spuštění | Bezpečnostní testování + AD integrační testování |
| AC004 | Funkce preview šablon - Uživatelé mohou zobrazit náhled šablon před publikováním s přesným renderováním | ✅ Ano | Preview odpovídá publikované verzi >99% | ✅ Ano - standardní preview schopnost | ✅ Ano - zajištění kvality | Datum spuštění | Vizuální srovnávací testování |
| AC005 | Funkcionalita exportu - Šablony exportovány ve specifikovaných formátech (PDF, Excel, JSON) s kompletními daty | ✅ Ano | 100% úplnost dat v exportech, <5s čas exportu | ✅ Ano - standardní export funkce | ✅ Ano - integrační požadavek | Datum spuštění | Automatizované testování exportních formátů |

---

## 9. Přílohy

### Podpůrné Poznámky
- ✅ Všechny fáze projektu (1-11) byly úspěšně dokončeny s plným stakeholder validací
- ✅ Interní review cyklus dokončen s drobnými vylepšeními, které posílily projektovou definici
- ✅ Externí validační sessions potvrdily připravenost k implementaci
- ✅ Finální schválení správou uděleno s pochvalou za důkladnou dokumentaci
- ✅ Projekt je autorizován k implementaci s kompletní podporou governance

### Glosář

| Termín | Definice |
|--------|----------|
| CRUD | Create, Read, Update, Delete - základní operace pro správu dat |
| AD (Active Directory) | Microsoft služba adresáře pro správu identit a přístupů |
| RBAC | Role-Based Access Control - řízení přístupu založené na rolích |
| API | Application Programming Interface - rozhraní pro programové aplikace |
| SSO | Single Sign-On - jednotné přihlášení |
| iframe | HTML element pro vkládání jiných HTML dokumentů |
| SMART kritéria | Specific, Measurable, Achievable, Relevant, Time-bound - kritéria pro definici cílů |

### Reference
- 📋 JIRA Epic: QUESTIONNAIRE-ADMIN-2024
- 📖 Organizační šablony projektových definic
- 🏛️ IT Governance Framework
- 🔒 Security a Compliance politiky
- 🔐 Active Directory dokumentace

### Metadata Projektu
- **Session ID:** QUESTIONNAIRE-ADMIN-2024-SESSION
- **Datum Analýzy:** 11. září 2025
- **Použité Nástroje:** Claude Code Project Definition Workflow
- **Soubory Kontextu:**
  - Controller Context: QUESTIONNAIRE-ADMIN-2024-controller.json
  - Facilitator Context: facilitator-context.json
  - Consolidator Context: consolidator-context.json
  - Finalizer Context: finalizer-context.json

---

*Vygenerováno pomocí Claude Code Project Definition Workflow*  
*Datum: 11. září 2025 | Verze: v1.0*