### Market Information Management

#### role_definition
Consolidate market information from multiple sources and in any suitable media/format in order to build a bank financial market knowledge-base. The service domain activities include maintaining, refining, qualifying/verifying and presenting information in order to improve the quality of the available market intelligence within the bank

#### core_business_object
Financial Market Information Service (object_26.html?object=45719)

#### key_features
- Determine the required scope of market information to be maintained
- Source suitable market information sources and consolidate records
- Verify and qualify the accuracy of the information
- Structure/present the information in reports suited to business analysis and review

#### example_of_use
The bank consolidates multiple sources of private company merger and acquisition activity in order to maintain a view of private company players in a target sector

#### triggered_by
- Customer Relationship Management (object_21.html?object=30437)

#### triggers
No triggers specified

#### list_of_scenarios
- Handle Request for Windfall Investment (views/view_55037.html)

#### api_bian_portal_link
Market Information Management API (https://app.swaggerhub.com/apis/BIAN3/MarketInformationManagement/12.0.0)

---

### Market Analysis

#### role_definition
This service domain supports the broad range of market analysis needed to support business management decisions across the bank. It draws on external market research and internally generated business information as necessary. It is used to develop insights into market trends and potential opportunities/threats. It may also be used to evaluate key events that might impact the bank's business directly or that of important customers and customer segments. A standard set of analytical views can be defined that are maintained. Furthermore the service domain may provide ad-hoc/customized analysis services

#### core_business_object
Market Analysis (object_26.html?object=38731)

#### key_features
- Determine the range of standard market analyses reports to support
- Support ad-hoc market analysis request
- Consolidate market research and internal information sources
- Develop market analysis reports
- Provide access to market analysis reports

#### example_of_use
External market research is used to develop competitor analysis for bank products as input to a prospect campaign development

#### triggered_by
- Business Development (object_20.html?object=32900)
- Prospect Campaign Execution (object_22.html?object=47050)

#### triggers
- Competitor Analysis (object_20.html?object=33057)
- Market Research (object_21.html?object=34938)

#### list_of_scenarios
- Analyse Customer Segment Performance (views/view_55046.html)
- Develop Advertising Campaign (views/view_55317.html)
- Execute External Campaign (views/view_55170.html)
- Analyse External Campaign Portfolio Performance (views/view_55338.html)
- Perform Internal Campaign Development (views/view_55520.html)
- Develop External Campaign (views/view_54948.html)
- Analyse Internal Campaign Portfolio Performance (views/view_54672.html)
- Analyse Competitor Activity (views/view_54711.html)
- Analyse Product Portfolio Performance (views/view_54619.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/MarketAnalysis/12.0.0

---

### Market Data Switch Administration

#### role_definition
Administer the internal information distribution 'switch' with external and external market information feeds and associated employee access rights. Note this can include 'brokering' information access on a first come first serve basis for limited active user number feed services

#### core_business_object
Information Feed Switch Administrative Plan (object_24.html?object=133284)

#### key_features
- Administer internal information distribution switch
- Manage external market information feeds
- Control employee access rights
- Broker information access for limited user feeds

#### example_of_use
A new employee is provided with the standard access to information feed at their trading desk

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
No scenarios specified

#### api_bian_portal_link
Not specified in the document

---

### Financial Market Analysis

#### role_definition
Analyze available sources of internal and external financial market information and research to develop insights and opinions on any aspect of financial market activity and pricing

#### core_business_object
Financial Market Analysis (object_24.html?object=38711)

#### key_features
- Identify sources of financial market research
- Select appropriate analytical algorithms/hypotheses to apply
- Consolidate information and apply/refine algorithms
- Interpret and present analytical insights

#### example_of_use
A competitor financial pricing analysis is requested for a company issuing corporate paper

#### triggered_by
- Investment Portfolio Analysis (object_21.html?object=37857)

#### triggers
- Financial Market Research (object_21.html?object=38415)

#### list_of_scenarios
- Process Performance Review (views/view_55107.html)
- Process Portfolio Rebalancing (views/view_55523.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/FinancialMarketAnalysis/12.0.0

---

### Financial Market Research

#### role_definition
Consolidate financial market information from a variety of sources and optionally organize the consolidated information to align to different topics or categories for subsequent selection and analysis (see Financial Market Analysis)

#### core_business_object
Financial Market Research (object_26.html?object=31660)

#### key_features
- Identify and subscribe to financial market research services
- Operate access to financial market research service to obtain reports
- Consolidate, classify and maintain research
- Provide access to financial market research within the bank (direct and for analysis)
- Support ad-hoc requests to identify and obtain financial market research

#### example_of_use
An investment portfolio manager obtains financial market research to support portfolio rebalancing decisions

#### triggered_by
- Financial Market Analysis (object_21.html?object=37182)
- Investment Portfolio Analysis (object_21.html?object=37857)

#### triggers
No triggers specified

#### list_of_scenarios
- Process Performance Review (views/view_55107.html)
- Process Portfolio Rebalancing (views/view_55523.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/FinancialMarketResearch/12.0.0

---

### Public Reference Data Management

#### role_definition
This service domain maintains and provides structured access to standard 'global' reference data and definitions associated with market activity such as currency, country and segment identifiers. These values will typically be externally sourced using market information feeds and distributed using whatever is the appropriate mechanism within the bank

#### core_business_object
Global Standard Specification (object_24.html?object=45962)

#### key_features
- Identify global data standards and sources
- Arrange for access to external reference data sources
- Import and disseminate public/global reference data

#### example_of_use
The international ISO standard definitions are maintained and applied across production systems of the bank

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
No scenarios specified

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/PublicReferenceDataManagement/12.0.0

---

### Customer Surveys

#### role_definition
Handle the deployment, execution and on-going refinement of customer surveys. This includes many types of survey including traditional mailshot questionnaires, in production review/feedback solicitation, review panels/focus groups. The survey execution process performs the survey definitions, selection of reviewers, surveying and post survey analysis

#### core_business_object
Customer Survey (object_26.html?object=48721)

#### key_features
- Customer survey definition/refinement
- Reviewer selection/identification
- Customer survey execution
- Customer survey analysis and feedback

#### example_of_use
A bank develops a customer questionnaire to obtain feedback from customers that make frequent use of the self-service contact center facility for service improvement suggestions

#### triggered_by
- Market Research (object_21.html?object=34938)

#### triggers
No triggers specified

#### list_of_scenarios
- Analyse Customer Segment Performance (views/view_55046.html)

#### api_bian_portal_link
Customer Surveys API (https://app.swaggerhub.com/apis/BIAN-3/CustomerSurveys/12.0.0)

---

### Segment Direction

#### role_definition
Define, implement, track and assess the business performance goals for defined market segments. This perspective supports a particular organizational structure where enterprise strategies and plans are aligned to market segments (often in addition to product divisions)

#### core_business_object
Market Segment Strategy (object_26.html?object=45112)

#### key_features
- Define governing policies and guidelines
- Define business goals
- Define supporting business development strategies
- Track progress towards goals and direct activity

#### example_of_use
Corporate direction notifies segment leadership of changed goals and priorities that impact their activity

#### triggered_by
- Business Development (object_20.html?object=32900)

#### triggers
No triggers specified

#### list_of_scenarios
- Analyse Customer Segment Performance (views/view_55046.html)
- Develop Advertising Campaign (views/view_55317.html)
- Analyse External Campaign Portfolio Performance (views/view_55338.html)
- Perform Internal Campaign Development (views/view_55520.html)
- Develop External Campaign (views/view_54948.html)
- Analyse Internal Campaign Portfolio Performance (views/view_54672.html)
- Analyse Competitor Activity (views/view_54711.html)
- Analyse Product Portfolio Performance (views/view_54619.html)

#### api_bian_portal_link
Segment Direction API (https://app.swaggerhub.com/apis/BIAN-3/SegmentDirection/12.0.0)

---

### Market Research

#### role_definition
This service domain supports general market research for a wide range of uses and sources - including customer and competitor activity and related market assessments. It can combine subscribing to and consolidating market research with supporting on-line/interactive access to market news sources (general, not financial market). A more sophisticated implementation will support specific market information requests and the consolidation of gathered intelligence

#### core_business_object
Market Research (object_26.html?object=45160)

#### key_features
- Identify and subscribe to market resource services
- Operate access to market research service to obtain reports
- Consolidate, classify and maintain research
- Provide access to market research within the bank (direct and for analysis)
- Support ad-hoc requests to identify and obtain market research

#### example_of_use
A market research department handles the access and consolidation and classification of market research

#### triggered_by
- Customer Relationship Management (object_21.html?object=30437)
- Competitor Analysis (object_20.html?object=33057)
- Customer Behavior Insights (object_21.html?object=34917)
- Market Analysis (object_21.html?object=36136)
- Advertising (object_21.html?object=37299)
- Prospect Campaign Design (object_22.html?object=39556)
- Customer Campaign Design (object_22.html?object=47269)

#### triggers
- Customer Surveys (object_20.html?object=33538)

#### list_of_scenarios
- Analyse Customer Segment Performance (views/view_55046.html)
- Develop Advertising Campaign (views/view_55317.html)
- Execute External Campaign (views/view_55170.html)
- Develop Customer Insights (views/view_55541.html)
- Analyse External Campaign Portfolio Performance (views/view_55338.html)
- Perform Internal Campaign Development (views/view_55520.html)
- Perform Customer Relationship Development Planning (views/view_55161.html)
- Develop External Campaign (views/view_54948.html)
- Analyse Internal Campaign Portfolio Performance (views/view_54672.html)
- Analyse Competitor Activity (views/view_54711.html)
- Analyse Product Portfolio Performance (views/view_54619.html)

#### api_bian_portal_link
Market Research API (https://app.swaggerhub.com/apis/BIAN-3/MarketResearch/12.0.0)

---

### Market Data Switch Operation

#### role_definition
This facility handles the real-time operation of the market information dissemination switch that is typically used to support trading and investment functions. It references the access entitlement to services for users maintained by the Market Data Switch Administration service domain (there can be complex rules governing access to various feeds). The dissemination mechanism/switch may support composite pages of data and interactive service requests. It may also support internally published information such as bank rates defined by the bank's treasury unit

#### core_business_object
Market Information Switch Session (object_25.html?object=30354)

#### key_features
- Handle access to the information provider (IP) service content
- Store and forward (IP) content over the internal switch
- Handle internal access to the IP content based on user access rights/requests
- Publish internal content over the data switch

#### example_of_use
A bank trader request access to a market data feed at their dealing position during a trading session

#### triggered_by
- Payment Initiation (object_20.html?object=29967)
- Customer Relationship Management (object_21.html?object=30437)
- Corporate Current Account (object_21.html?object=34221)
- Payment Order (object_21.html?object=35550)
- Card Clearing (object_21.html?object=36804)
- Letter of Credit (object_21.html?object=38418)
- Bank Guarantee (object_22.html?object=44405)

#### triggers
No triggers specified

#### list_of_scenarios
- Handle Request for Windfall Investment (views/view_55037.html)
- Handle Request for Corporate Loan (views/view_55212.html)
- Handle Request for Outgoing FCY Credit Transfer via SWIFT (views/view_55095.html)
- Initiate Bank Guarantee (views/view_55496.html)
- Handle Request for Bank Guarantee (views/view_55341.html)
- Process Card Clearing by Card Network (views/view_55080.html)
- Update Letter of Credit for Extension of Validity (views/view_55579.html)
- Handle Request to Extend Validity of Letter of Credit (views/view_55634.html)
- Handle Request to Issue Letter of Credit (views/view_55618.html)
- Initiate Letter of Credit (views/view_54819.html)
- Handle Incoming FCY Credit Transfer for LCY Account (views/view_54977.html)

#### api_bian_portal_link
Market Data Switch Operation API (https://app.swaggerhub.com/apis/BIAN-3/MarketDataSwitchOperation/12.0.0)
