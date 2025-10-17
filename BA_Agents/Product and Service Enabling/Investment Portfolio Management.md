### Investment Portfolio Management

#### role_definition
Orchestrate the investment/ rebalancing of an investment portfolio to optimize gains remaining within the terms of the portfolio 'charter' or agreement

#### core_business_object
Investment Portfolio (object_25.html?object=29475)

#### key_features
- Monitor market for opportunities/threats
- Match identified trading opportunity to investment portfolio policies
- Initiate market trades to rebalance/improve portfolio make-up

#### example_of_use
An investment manager monitoring the markets determines that an identified opportunity can be exploited for the portfolio, remaining in line with the portfolio policies

#### triggered_by
- Customer Relationship Management (object_21.html?object=30437)
- Investment Portfolio Management (object_21.html?object=32159)
- Investment Portfolio Planning (object_23.html?object=48534)

#### triggers
- Investment Portfolio Management (object_21.html?object=32159)
- Current Account (object_21.html?object=37122)
- Sales Product (object_21.html?object=37972)
- Customer Position (object_22.html?object=41136)
- Investment Account (object_22.html?object=41278)
- Customer Product and Service Directory (object_22.html?object=41591)
- Product Design (object_22.html?object=44093)
- Product Matching (object_22.html?object=44814)
- Party Reference Data Directory (object_22.html?object=45230)
- Session Dialogue (object_23.html?object=48273)
- Investment Portfolio Planning (object_23.html?object=48534)

#### list_of_scenarios
- Handle Request for Windfall Investment (views/view_55037.html)
- Handle Request for Investment Plan (views/view_55514.html)
- Process Portfolio Rebalancing (views/view_55523.html)
- Conduct Customer Centric Product Manufacturing (views/view_54849.html)

#### api_bian_portal_link
Investment Portfolio Management API (https://app.swaggerhub.com/apis/BIAN-3/InvestmentPortfolioManagement/12.0.0)

##### IT details
- REST APIs:  investmentAdvisoryModeling
- Key API Operations: approve existing modeling or get details of it
- Event Streams:  
    JTB-CZ_INVESTMENT_CUSTOM_PROIFLE_SYNC
    JTB-CZ_INVESTMENT_MODELING_DETAIL_SYNC
    JTB-CZ_INVESTMENT_MODELING_ORDER_SYNC
    JTB-CZ_INVESTMENT_MODELING_STARE_AFTER_SYNC
- Core System: 
    Investiční poradentsvi
- Data Objects: 
    Custom Modeling Profile - individual, standard, and risk level
    Modeling details - information of rebalancing (assets allocations -  current vs target model)
    Modeling Orders - collection of orders to rebalance portfolio
    Target asset allocation - the state after execution of orders 
- Key Systems flow: DKCZ -> ESBW -> Investicni poradenstvi -> EI Kafka -> DKCZ
- Data Quality: 



---

### Investment Portfolio Analysis

#### role_definition
Perform scheduled and ad-hoc performance analysis on a customer's investment portfolio. This can include different types of analysis and performance comparisons

#### core_business_object
Investment Portfolio (object_25.html?object=29475)

#### key_features
- Consolidate investment portfolio transaction details and comparative market activity reports
- Select types of performance analysis and apply analyses to the period of transaction data
- Develop portfolio performance comparisons and evaluations/justifications

#### example_of_use
A relationship manager requests an investment portfolio performance analysis prior to a regular client meeting

#### triggered_by
- Customer Relationship Management (object_21.html?object=30437)

#### triggers
- Financial Market Analysis (object_21.html?object=37182)
- Financial Market Research (object_21.html?object=38415)
- Investment Account (object_22.html?object=41278)

#### list_of_scenarios
- Process Performance Review (views/view_55107.html)
- Process Portfolio Rebalancing (views/view_55523.html)

#### api_bian_portal_link
Investment Portfolio Analysis API (https://app.swaggerhub.com/apis/BIAN-3/InvestmentPortfolioAnalysis/12.0.0)

---

### Hedge Fund Administration

#### role_definition
Hedge funds group accredited investors as limited partners to the fund with the fund manager as the general partner. As investors are restricted to being accredited a hedge funds is free to make more aggressive investment decisions and can generate higher returns. Fund income combines management and performance fees

#### core_business_object
Not explicitly mentioned in the document

#### key_features
- Handle the fund's accounting, tax administration and financial reporting needs
- Manage/develop the fund, investing in alignment with fund policy
- Handle investor inflows and outflow processing to the fund
- Process management and performance fees
- Support/oversee all general investor servicing and process middle and back office functions

#### example_of_use
A bank operates a hedge fund to support its accredited investment customers. The fund targets a market segment of specific interest to its investor membership

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
No scenarios specified

#### api_bian_portal_link
Hedge Fund Administration API (https://app.swaggerhub.com/apis/BIAN-3/HedgeFundAdministration/12.0.0)

---


### Mutual Fund Administration

#### role_definition
Mutual funds provide an investment vehicle to general investors and as such are highly regulated and tend to focus on lower risk/return investments. Mutual funds are allowed to charge investors a management fee, but unlike hedge funds the mutual fund manager is not permitted to share in the fund's performance

#### core_business_object
Not explicitly mentioned in the document

#### key_features
- Handle the fund's accounting, tax administration and financial reporting needs
- Manage/develop the fund, investing in alignment with fund policy
- Handle investor inflows and outflow processing to the fund
- Process management fees
- Support/oversee all general investor servicing and process middle and back office functions

#### example_of_use
A bank operates mutual funds to offer its non accredited customers access to suitably structured investment opportunities.

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
No scenarios specified

#### api_bian_portal_link
Mutual Fund Administration API (https://app.swaggerhub.com/apis/BIAN-3/MutualFundAdministration/12.0.0)

---

### Investment Portfolio Planning

#### role_definition
Agree the customer investment portfolio governing principles, risk appetite, management/trading guidelines and target portfolio profile. Identify any desired/target and 'out of bounds' securities/sectors. Ensure disclosures and related eligibility, suitability and other regulatory obligations are addressed and reflected in the agreement

#### core_business_object
Investment Portfolio (object_25.html?object=29475)

#### key_features
- Identify and agree investment portfolio properties and make-up (includes risk appetite)
- Handle regulatory and bank requirements (e.g. disclosures, suitability, eligibility)
- Identify any target and securities to avoid
- Agree key roles and schedules for the investment portfolio handling

#### example_of_use
A relationship manager established the investment agreement for a customer that is setting up a managed investment portfolio

#### triggered_by
- Customer Relationship Management (object_21.html?object=30437)
- Investment Portfolio Management (object_21.html?object=32159)

#### triggers
- Product Expert Sales Support (object_21.html?object=32141)
- Investment Portfolio Management (object_21.html?object=32159)
- Product Directory (object_21.html?object=34953)
- Suitability Checking (object_21.html?object=38647)
- Regulatory Compliance (object_22.html?object=46420)

#### list_of_scenarios
- Handle Request for Windfall Investment (views/view_55037.html)
- Process Performance Review (views/view_55107.html)
- Handle Request for Investment Plan (views/view_55514.html)
- Process Portfolio Rebalancing (views/view_55523.html)
- Handle Request for Product Selection (views/view_55673.html)

#### api_bian_portal_link
Investment Portfolio Planning API (https://app.swaggerhub.com/apis/BIAN-3/InvestmentPortfolioPlanning/12.0.0)

##### IT details
- REST APIs:  investmentAdvisoryModeling
- Key API Operations: approve existing modeling or get details of it
- Event Streams:  
    JTB-CZ_INVESTMENT_CUSTOM_PROIFLE_SYNC
    JTB-CZ_INVESTMENT_MODELING_DETAIL_SYNC
    JTB-CZ_INVESTMENT_MODELING_ORDER_SYNC
    JTB-CZ_INVESTMENT_MODELING_STARE_AFTER_SYNC
- Core System: 
    Investiční poradentsvi
- Data Objects: 
    Custom Modeling Profile - individual, standard, and risk level
    Modeling details - information of rebalancing (assets allocations -  current vs target model)
    Modeling Orders - collection of orders to rebalance portfolio
    Target asset allocation - the state after execution of orders 
- Key Systems flow: DKCZ -> ESBW -> Investicni poradenstvi -> EI Kafka -> DKCZ
- Data Quality: 
