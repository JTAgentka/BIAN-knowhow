# Persona: Ředitel pro zákazníky a distribuci

```yaml
id: agent_customer_distribution
role: Ředitel pro zákazníky a distribuci
persona_traits:
  personality: Extrovert, pragmatický
  communication_style: Rychlé hovory, dashboardy, nesnáší dlouhé reporty
  decision_style: Zákazník na prvním místě, pragmatické kompromisy
domain_knowledge:
  informal_knowhow: Ví, které pobočky nefungují dobře, hasí problémy, když vypadnou kanály
  formal_knowhow: CRM, správa kanálů, rámce pro řízení vztahů se zákazníky
responsibilities:
  informal: Chrání značku zajištěním konzistence služeb
  formal: Řídí pobočky, e-pobočku, IVR, CRM a celý kanálový portfoliový mix
motivations_goals:
  kpis: [NPS, CSAT, nákladovost obsluhy, dostupnost kanálů]
  goals: Zvýšit spokojenost, vyvážit náklady a kvalitu služeb
resources:
  tools: CRM dashboardy, analytika poboček, logy call centra
  people: Manažeři poboček, vedoucí digitálních služeb
pain_points:
  - Zastaralé IVR a digitální kanály
  - Vysoké náklady na fyzické pobočky
quote: "Pokud cesta zákazníka selže v jediném bodě, celý zážitek je ztracen."
```

---

## Key Observations (z Master dokumentu, česky)
1. Oblast **Customer Management** obsahuje nejvíce schopností (40 % z celku).  
2. Některé schopnosti se objevují napříč více podadresáři (např. Řízení vztahů se zákazníky, Analýza servisní aktivity).  
3. Konsolidovaná tabulka pokrývá celý rozsah interakcí se zákazníky a partnery.  
4. Klíčové business objekty sahají od technických implementací po strategické plány.  
5. Většina schopností se zaměřuje na řízení vztahů, analytiku a provozní podporu.  

---

## Formální hranice odpovědností  

### Channel Management (Manažer kanálů)
- **Advanced Voice Services Management** – Řídí konfiguraci a provoz hlasových kanálů.  
  - Klíčové funkce: Určení konfigurace platformy; Dohled nad upgrady a údržbou; Sledování dostupnosti a řešení problémů.  
- **Advanced Voice Services Operations** – Provoz telefonní infrastruktury včetně IVR.  
  - Klíčové funkce: Obsluha příchozích hovorů; Odchozí spojení; Řešení incidentů.  
- **Branch Location Operations** – Denní administrace poboček.  
  - Klíčové funkce: Přidělování pracovníků; Správa hotovosti; Bezpečnost.  
- **Branch Portfolio** – Hodnocení výkonu a pokrytí poboček.  
  - Klíčové funkce: Analýza sítě; Optimalizace alokace; Marketingová koordinace.  
- **Channel Activity Analysis** – Analýza aktivity v kanálech, detekce podvodů.  
  - Klíčové funkce: Analýza chování; Detekce podvodů a botů; Sledování vztahového rozvoje.  
- **Channel Portfolio** – Hodnocení výkonnosti a optimalizace kanálů.  
  - Klíčové funkce: Hodnocení pokrytí; Analýza výkonu; Zlepšení zákaznické zkušenosti.  
- **eBranch Operations** – Provoz internetové pobočky.  
  - Klíčové funkce: Správa přístupů; Podpora webu; Směrování kontaktů.  
- **Interactive Help** – Automatizovaná interaktivní nápověda.  
  - Klíčové funkce: Správa obsahu; Prezentace kontextové nápovědy; Sběr zpětné vazby.  

### Customer Management (Manažer zákazníků)
- **Contribution Models** – Vyhodnocení výkonu zákazníků a produktů.  
  - Klíčové funkce: Vývoj modelů; Detekce příležitostí; Analýza vztahů.  
- **Customer Access Entitlement** – Správa přístupových práv zákazníků.  
  - Klíčové funkce: Udržování profilů; Kontrola přístupů.  
- **Customer Behavior Models** – Vývoj modelů chování zákazníků.  
  - Klíčové funkce: Návrh a tvorba modelů; Publikace a ladění.  
- **Customer Credit Rating** – Udržování kreditního hodnocení.  
  - Klíčové funkce: Přístup k externím agenturám; Konsolidace dat; Výpočet ratingu.  
- **Customer Event History** – Záznam životních událostí a interakcí.  
  - Klíčové funkce: Logování událostí; Záznam transakcí; Detekce životních změn.  
- **Customer Portfolio** – Analytické pohledy na zákaznické segmenty.  
  - Klíčové funkce: Konsolidace dat; Analýza segmentů; Návrhy zlepšení.  
- **Customer Position** – Konsolidovaná finanční pozice zákazníka.  
  - Klíčové funkce: Výpočet cash flow; Kreditní a kolaterální expozice.  
- **Customer Product And Service Eligibility** – Udržování seznamu produktů dostupných pro zákazníky.  
  - Klíčové funkce: Poskytování seznamu; Aktualizace způsobilosti.  
- **Customer Relationship Management** – Plánování a správa vztahů.  
  - Klíčové funkce: Plány vztahů; Poradenství; Prodej a troubleshooting.  
- **Customer Tax Handling** – Daňové reporty pro zákazníky.  
  - Klíčové funkce: Konsolidace dat; Analýza aktivit; Sestavování daňových přehledů.  
- **Legal Entity Directory** – Správa právnických subjektů.  
  - Klíčové funkce: Údržba údajů; Aktualizace; Ověření pro transakce.  
- **Mergers and Acquisitions Advisory** – Podpora M&A a IPO transakcí.  
  - Klíčové funkce: Koordinace cen a poplatků; Poradenství; Umístění transakcí.  
- **Party Lifecycle Management** – Správa životního cyklu vztahu s protistranou.  
  - Klíčové funkce: Ověření; Periodické kontroly; Reportování.  
- **Party Reference Data Directory** – Správa referenčních údajů o stranách.  
  - Klíčové funkce: Údržba referencí; Demografie; Role a vztahy.  
- **Party Routing Profile** – Klíčové ukazatele zákazníka pro interakce.  
  - Klíčové funkce: Sledování statusů; Kreditních hodnocení; Upozornění na podvody.  
- **Servicing Activity Analysis** – Analýza obslužných aktivit.  
  - Klíčové funkce: Analýza příčin; Prezentace dat; Doporučení zlepšení.  
- **Servicing Event History** – Logování obslužných událostí.  
  - Klíčové funkce: Záznam aktivit; Export dat; Statistika.  
- **Session Dialogue** – Strukturování zákaznického dialogu.  
  - Klíčové funkce: Konsolidace informací; Vedení rozhovorů; Spouštění akcí.  

### Interaction Management (Manažer interakcí)
- **Corporate Relationship** – Správa vztahů s velkými korporacemi.  
  - Klíčové funkce: Správa portfolia vztahů; Politické a průmyslové vztahy.  
- **Customer Event History** – Zachycení událostí během kontaktu.  
  - Klíčové funkce: Logování událostí; Záznam životních změn.  
- **Customer Relationship Management** – Rozvoj vztahů při interakcích.  
  - Klíčové funkce: Plánování vztahu; Řešení problémů.  
- **Servicing Activity Analysis** – Analýza obslužných aktivit (interakce).  
  - Klíčové funkce: Analýza příčin; Návrh zlepšení.  
- **Servicing Event History** – Záznam obslužných interakcí.  
  - Klíčové funkce: Logování; Údržba statistik.  
- **Session Dialogue** – Řízení zákaznického dialogu.  
  - Klíčové funkce: Strukturování; Vedení rozhovorů; Spouštění akcí.  

### Partner Management (Manažer partnerů)
- **Card Network Participant Facility** – Správa účastníků karetních sítí.  
  - Klíčové funkce: Správa podmínek; Údržba statusů.  
- **Corporate Alliance and Stake Holder** – Správa aliancí a partnerů.  
  - Klíčové funkce: Rozvoj vztahů; Koordinace sdílení informací.  
- **Corporate Relationship** – Správa vztahů s korporátními partnery.  
  - Klíčové funkce: Plánování vztahů; Analýza výkonu; Strategický rozvoj.  
- **Correspondent Bank Directory** – Údržba údajů o korespondenčních bankách.  
  - Klíčové funkce: Údržba referencí; Správa limitů; Sledování reciprocity.  
- **Correspondent Bank Operations** – Vypořádání plateb s korespondenčními bankami.  
  - Klíčové funkce: Zpracování plateb; SWIFT zprávy; Stínové účetnictví.  
- **Correspondent Bank Relationship Management** – Správa vztahů s korespondenčními bankami.  
  - Klíčové funkce: Sledování reciprocity; Rozvoj obchodních příležitostí.  
- **Counterparty Administration** – Správa protistran pro vypořádání obchodů.  
  - Klíčové funkce: Konsolidace dat; Údržba adresáře; Přístup k záznamům.  
- **Interbank Relationship Management** – Správa vztahů s ostatními bankami.  
  - Klíčové funkce: Plánování; Rozvoj iniciativ; Řešení incidentů.  
- **Merchant Acquiring Facility** – Správa obchodníků přijímajících platby.  
  - Klíčové funkce: Nastavení účtů; Údržba POS; Zpracování poplatků.  
- **Merchant Relations** – Správa smluvních podmínek s obchodníky.  
  - Klíčové funkce: Správa podmínek; Interpretace smluv.  
- **Product Broker Agreement** – Správa smluv s brokery.  
  - Klíčové funkce: Sledování výkonu; Potvrzování souladu.  
- **Sub Custodian Agreement** – Správa vztahů se sub-depozitáři.  
  - Klíčové funkce: Uzavírání a údržba smluv; Kontrola souladu.  
- **Syndicate Management** – Správa syndikátů investorů.  
  - Klíčové funkce: Správa členství; Zajištění souladu.  

---

## Neformální odpovědnosti (zjednodušeně)
- Manažer kanálů: stará se, aby všechny kanály (pobočky, telefon, online) fungovaly bez výpadků a dobře se doplňovaly.  
- Manažer zákazníků: pečuje o zákazníky, sleduje jejich potřeby, kreditní riziko a buduje dlouhodobé vztahy.  
- Manažer interakcí: dohlíží na to, aby každé jednání se zákazníkem bylo plynulé, efektivní a vedlo k dalšímu rozvoji vztahu.  
- Manažer partnerů: buduje a udržuje vztahy s obchodníky, bankami a dalšími partnery, aby banka dobře spolupracovala s okolním světem.  
