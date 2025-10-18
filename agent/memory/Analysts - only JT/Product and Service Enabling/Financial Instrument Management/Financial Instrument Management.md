# Financial Instrument Management

## Service Domains

---

### Corporate Action

#### role_definition
Corporate actions cover a range of activities that directly impact the share price and hence the shareholders of a company. The main types of corporate action include stock splits and reversals, dividend (both cash and stock), rights issues, mergers and acquisitions and spin-offs. This service domain handles the required processing for a customer's securities that are held in custody by the bank

#### core_business_object
Corporate Action (object_38.html?object=45491)

#### key_features
- Custodial stock split/reversal processing
- Custodial security dividend payment processing
- Custodial security rights issue processing
- Custodial security mergers and acquisition processing
- Custodial security spin-off processing

#### example_of_use
A bank processes the required custody adjustments for customers holding security in a stock that is split by its issuing company

#### triggered_by
(None specified)

#### triggers
(None specified)

#### list_of_scenarios
(None specified)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CorporateAction/12.0.0

##### IT details
- REST APIs:  
- Key API Operations: 
- Event Streams:  JTB-HQ_INVESTMENT_INSTRUMENT-EVENT_STREAM_GNR
- Core System: CCP
- Data Objects: Instrument Event 
- Key Systems flow: Bloomber -> CCP -> EI Kafka -> DKCZ/DKSK 
- Data Quality: 

---

### Currency Exchange

#### role_definition
This is an over the counter service where currency is exchanged and the transaction uses preferential rates and can include transaction fees. Note in some cases travelers checks can be handled as a pseudo currency within this capability. Note that Branch and teller currency inventory tracking and distribution is administered by Branch Currency Management and Branch Currency Distribution service domains

#### core_business_object
Currency Exchange (object_38.html?object=46442)

#### key_features
- FX transaction pricing
- FX transaction capture
- Document handling

#### example_of_use
A non-bank customer obtains a currency exchange at the teller, buying foreign currency for local currency in cash

#### triggered_by
- Business Unit Management
- Business Development

#### triggers
- Branch Currency Distribution
- Corporate Treasury
- Current Account
- Financial Accounting

#### list_of_scenarios
(None specified)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CurrencyExchange/12.0.0

##### IT details
- REST APIs:  
- Key API Operations: 
- Event Streams:  JTB-HQ_EXCHANGE-RATES_FXRATES_INSTANT_STREAM_GNR - instantní s časovou složkou, JTB-HQ_EXCHANGE-RATES_FXRATES_DAILY_STREAM_GNR - denní 
- Core System: CCP
- Data Objects: FxRate record (denní, instantní) 
- Key Systems flow: CCP -> EI Kafka -> DKCZ/DKSK
- Data Quality: HIGH

---

### Custody Administration

#### role_definition
Administer the securities scrip (paper and electronic) holdings for a custodial arrangement. This includes administering the physical movements of securities, safe storage, the processing of associated dividends and interest and securities reporting

#### core_business_object
Custody Facility

#### key_features
- Administer securities movements
- Arrange safe storage
- Process dividends and interest against securities
- Report on securities holdings
- Determine and apply service fees

#### example_of_use
A customer uses the banks custodial services to handle their investment portfolio holdings

#### triggered_by
(None specified)

#### triggers
(None specified)

#### list_of_scenarios
(None specified)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/CustodyAdministration/12.0.0

---

### ECM And DCM

#### role_definition
The service domain provides fulfillment services for the issuance of primary market equity and debt capital market instruments for corporate customers. It supports both private and public (IPO) placements and covers the specification, pricing and placement activities associated with issuance. (it does not include secondary market trading of the instrument)

#### core_business_object
Capital Market Agreement

#### key_features
- Determining and specifying the equity/debt instrument
- Prospectus and pricing
- Road show and placement

#### example_of_use
A corporate customer raises capital through issuing corporate debt in the private capital markets

#### triggered_by
- Customer Relationship Management
- ECM And DCM

#### triggers
- Term Deposit
- Interbank Relationship Management
- Payment Order
- Asset And Liability Management
- Suitability Checking
- ECM And DCM
- Guideline Compliance
- Corporate Loan

#### list_of_scenarios
- Handle Request for Issuance of Commercial Paper

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ECMAndDCM/12.0.0

---

### Financial Instrument Reference Data Management

#### role_definition
Maintain a central reference directory of market traded asset/instrument details. The details are typically captured from one or more specialist market feeds that publish market asset/instrument details. It can include the result of internal reference data processing

#### core_business_object
Financial Instrument Directory Entry

#### key_features
- Consolidate reference data from market sources
- Classify and verify reference data
- Organize reference data for ease of access
- Provide access to instrument reference data

#### example_of_use
A corporate financial advisory project references different instrument specifications when assembling a structured financial approach to the customer financing needs

#### triggered_by
(None specified)

#### triggers
(None specified)

#### list_of_scenarios
(None specified)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/FinancialInstrumentReferenceDataManagement/12.0.0

##### IT details
- REST APIs:  
- Key API Operations: 
- Event Streams: JTB-HQ_INVESTMENT_INSTRUMENT_STREAM_GNR, JTB-HQ_INVESTMENT_MARKET_DEPTH_STREAM_GNR
- Core System: CCP
- Data Objects:
    Instrument - statické udaje o finančních instrumentech
    Market Depth - hloubka trhu pro sledování liqudity 
- Key Systems flow: STAHOVALDA -> CCP -> EI KAFKA -> DKCZ/DKSK
- Data Quality: Poor - duplicates entries with ProdKat (například směnky jsou řešeny jinak než ostatní Cenné papíry)

---

### Financial Instrument Valuation

#### role_definition
Provide securities/asset valuation services. A wide range of valuation approaches can be applied to a range of different instrument/asset types. This Service Domain implements a process by which the most appropriate valuation method is selected and applied in the context of the valuation request and the purpose of the valuation. The fundamental pricing principle is based on an analysis of the present value of expected cash flows. This calculation involves identifying the expected cash flows, determining appropriate (range of)interest rates that might discount future cash flows and calculate the current value of future cash flows applying those interest rates

#### core_business_object
Market Asset Valuation Procedure

#### key_features
- Support the selection from various financial asset valuation approaches (e.g. market, income, replacement) and depending on the type of financial asset and valuation context
- Consolidate information supporting the valuation assessment
- Determine and report on the financial asset valuation

#### example_of_use
The assets held in an investment portfolio are subject to valuation as part of an annual performance report

#### triggered_by
(None specified)

#### triggers
(None specified)

#### list_of_scenarios
(None specified)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/FinancialInstrumentValuation/12.0.0

##### IT details
- REST APIs:  
- Key API Operations: 
- Event Streams: 
    JTB-HQ_INSTRUMENT_MARKET_PRICE_INSTANT_STREAM_GNR
    JTB-HQ_INSTRUMENT_MARKET_PRICE_DELAYED_STREAM_GNR
    JTB-HQ_INSTRUMENT_MARKET_PRICE_DAILY_STREAM_GNR
    JTB-HQ_INSTRUMENT_VALUE_PRICE_INSTANT_STREAM_GNR
    JTB-HQ_INSTRUMENT_VALUE_PRICE_DELAYED_STREAM_GNR
    JTB-HQ_INSTRUMENT_VALUE_PRICE_DAILY_STREAM_GNR
    
- Core System: CCP
- Data Objects: 
    Market Price - InstrumentMarketPriceInstant, InstrumentMarketPriceInstantDelayed and  InstrumentMarketPriceDaily - kurzové ceny cenných papírů placené, zpožděné free a denní.
    Instrument Price  - InstrumentValuePriceInstant, InstrumentValuePriceInstantDelayed and  InstrumentValuePriceDaily -    oceňovací ceny z vodopádu cen se/bez zpožděných o 15 min (free) cenných papírů placené, zpožděné free a denní (závěrkové ceny]).
    Instrument Performance Market Price  - InstrumentPerformanceMarketPriceDaily -    oceňovací ceny z výkonosti cenného papíru v času k uzávěrce. 
    
- Key Systems flow: STAHOVALDA -> CCP -> EI KAFKA -> DKCZ/DKSK
- Data Quality: Poor - duplicates entries with ProdKat (například směnky jsou řešeny jinak než ostatní Cenné papíry)

---

### Financial Instrument Valuation Models

#### role_definition
Develop and maintain a portfolio of valuation models considering currency, interest rate, instrument quotes, indices, commodity prices and other market, liquidity and credit risk factors. Support the use of these models in trading and pricing activity

#### core_business_object
Market Asset Valuation Model Specification

#### key_features
- Develop and maintain valuation models
- Consider various risk factors
- Support trading and pricing activities

#### example_of_use
Financial engineers assess the coverage and currency of the portfolio of valuation models and update certain models accordingly

#### triggered_by
(None specified)

#### triggers
(None specified)

#### list_of_scenarios
(None specified)

#### api_bian_portal_link
Not specified in the document

---

### Private Placement

#### role_definition
Private placement covers the definition, pricing, placing and all supporting actions involved for a private offering of corporate equity or debt. A private placement avoids many of the more stringent regulatory constraints of a public offering but can only be placed with accredited investors. The associated equity or debt securities issued by the corporate do not need to be registered with the regulatory authorities.

#### core_business_object
Private Placement (object_38.html?object=48253)

#### key_features
- Determine and specify the optimum financing mechanism (debt or equity)
- Package the debt/equity security for investors
- Place the loan with accredited investors
- Process equity/debt instrument maintenance and fulfillment actions

#### example_of_use
The Corporate Finance unit of an investment bank provides support to a corporate customer with a private placement in order to raise finds for a planned expansion of their manufacturing capacity

#### triggered_by
(None specified)

#### triggers
(None specified)

#### list_of_scenarios
(None specified)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/PrivatePlacement/12.0.0

---

### Public Offering

#### role_definition
A public offering involves the specification and packaging of corporate equity or bonds in the public markets to raise capital. This can be the initial public offering (IPO) when a private company is first taken public, and secondary/follow-on offerings to raise further capital. IPO's involve a broad range of financial analysis, auditing and regulatory approval actions. A lead bank and several underwriting banks may coordinate to underwrite the initiative. Secondary offerings can be dilutive (create additional shares) or non-dilutive (redistribute existing shares).

#### core_business_object
Public Offering (object_37.html?object=44553)

#### key_features
- Determine and specify the optimum financing mechanism (debt or equity)
- Coordinate with regulators for the approval and registration of the instrument
- Develop comprehensive financial and managerial assessments to support the pricing of the instrument
- Package the debt/equity security for public investors and undertake road-shows as necessary
- Coordinate as lead or secondary underwriting bank for the IPO
- Support the traded equity/debt instrument maintenance and fulfillment actions if necessary

#### example_of_use
An investment bank assembles a consortia of banks as lead bank to orchestrate an IPO for a rapidly growing private company that wishes to raise significant capital to expand its operations

#### triggered_by
(None specified)

#### triggers
(None specified)

#### list_of_scenarios
(None specified)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/PublicOffering/12.0.0

---
