# Financial Instrument Management

## Service Domains

### ATM Network Operations

#### role_definition
This service domain handles all automated aspects of operating the ATM network. This includes tracking the movement of cash and documents through the network and its ATM devices. It also handles the detection and response to device errors and alerts, including overseeing the physical movement of cash and documents and the handling of device alerts and outages

#### core_business_object
ATM Network Operations (object_37.html?object=43392)

#### key_features
- Handle the distribution/deposit of cash through the ATM network
- Handle the capture and generation of ATM transaction related documentation
- Detect and respond to ATM device errors and outages

#### example_of_use
A bank tracks the distribution and retrieval of cash inventory across its ATM network of operations

#### triggered_by
- ATM Network Management

#### triggers
(None specified)

#### list_of_scenarios
- Review ATM Float and Outage

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ATMNetworkOperations/12.0.0

---

### Branch Currency Distribution

#### role_definition
This service domain handles the scheduling and secure distribution of currency throughout the branch network (for bank branches and remote ATM locations). It ensures the required float is maintained at locations and undertakes the movement into and out of central currency holding facilities as necessary to ensure cash availability

#### core_business_object
Cash Distribution Procedure

#### key_features
- Distribution vehicle fleet administration
- Distribution planning and scheduling
- Distribution activity monitoring and control
- Central cash access coordination

#### example_of_use
ATMs at a branch location are stocked with currency in response to anticipated customer demand

#### triggered_by
- Central Cash Handling

#### triggers
- Servicing Event History
- Branch Location Operations

#### list_of_scenarios
- Process Inventory of Cash and Distribution of Cash to Branches

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/BranchCurrencyDistribution/12.0.0

---

### Branch Currency Management

#### role_definition
This service domain is responsible for tracking the available cash (currency) inventory held and distributed within the Branch location to teller and ATM positions, to ensure adequate float is always available at all positions. Also to check balances and see that excess cash is transferred to secure central storage as appropriate. If necessary specific criteria can be selected to refine the allocation

#### core_business_object
Branch Currency Management (object_38.html?object=48818)

#### key_features
- Cash inventory usage and availability tracking
- Branch cash inventory requirements evaluation and planning
- Oversight of cash availability and movements within the branch

#### example_of_use
The branch management reviews the available float and confirms end of day balances at the teller positions

#### triggered_by
- ATM Network Management

#### triggers
(None specified)

#### list_of_scenarios
- Review ATM Float and Outage

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/BranchCurrencyManagement/12.0.0

---

### Central Cash Handling

#### role_definition
This service domain is responsible for tracking the available cash inventory held centrally and distributed/collected throughout the branch/ATM network and making allocation/redistribution requests to ensure adequate float is available at all locations and that excess cash at any location is transferred to central secure locations as appropriate. Also coordinating with other banks and central banks to ensure sufficient cash is on hand to support the branch network requirements

#### core_business_object
Central Cash Allocation

#### key_features
- Cash inventory usage and availability tracking
- Cash inventory requirements evaluation and planning
- Cash float availability and allocation oversight

#### example_of_use
The central cash management function reviews the current and projected available float at locations across the network to ensure adequate supply to meet projected demand

#### triggered_by
- Branch Location Operations

#### triggers
- Branch Currency Distribution

#### list_of_scenarios
- Process Inventory of Cash and Distribution of Cash to Branches

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/CentralCashHandling/12.0.0

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
