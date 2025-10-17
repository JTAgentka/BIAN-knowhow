### Financial Message Analysis

#### role_definition
Track and analyze financial message traffic to identify anomalies and potential fraudulent activity

#### core_business_object
Financial Network Gateway Analysis

#### key_features
- Individual Analytics: financialNetworkGatewayAnalysisAccumulators, financialNetworkGatewayAnalysisActivityAnalysis, financialNetworkGatewayAnalysisPerformanceAnalysis, financialNetworkGatewayAnalysisTrends&Events
- Portfolio Analytics: financialNetworkGatewayAnalysisPortfolioActivityAnalysis, financialNetworkGatewayAnalysisPortfolioMake-UpAnalysis, financialNetworkGatewayAnalysisPortfolioPerformanceAnalysis

#### example_of_use
A pattern of financial message traffic for a major counterparty is analyzed to reveal possible fraudulent behaviors

#### triggered_by
- Correspondent Bank Operations

#### triggers
- Not explicitly specified in the source document

#### list_of_scenarios
- Handle Request to Issue Guarantee on Request of Another Bank (views/view_54980.html)
- Process Incoming Credit Transfer for Letter of Credit (views/view_55656.html)
- Review Letter of Credit and Pass on to Exporter (views/view_54793.html)

#### api_bian_portal_link
Not provided in the source document

### Fraud Diagnosis

#### role_definition
Analyze suspect transaction with Customer behavior information across product portfolio, using Expert Systems/Artificial Intelligence and/or manual review, including customer contact to determine if transaction is fraudulent. Further apply Economic Model to determine transaction disposition and notify applicable Product Fulfillment SDs.

#### core_business_object
Fraud Diagnosis

#### key_features
- Analyse activity to assess likelihood of customer fraud
- Analyse activity to assess likelihood of merchant fraud
- Analyse activity to assess likelihood of intermediary fraud

#### example_of_use
Out of pattern card use is detected and the details passed for analysis. The analysis determines there is a high probability of fraud recommending appropriate containment actions

#### triggered_by
- Not explicitly specified in the source document

#### triggers
- Not explicitly specified in the source document

#### list_of_scenarios
- Service Role: Handle the assessment, diagnosis and resolution of cases of fraud that have been detected and confirmed in production

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/FraudDiagnosis/12.0.0

### Fraud Evaluation

#### role_definition
This service domain handles the structured execution of fraud detection tests/routines that are used to identify possible fraud by detecting out of pattern behaviors. The tests may run in-line with production or may access transaction logs as appropriate. Detected anomalies are passed for further analysis and resolution.

#### core_business_object
Fraud Evaluation

#### key_features
- Transaction data consolidation
- Fraud detection test execution
- Fraud analysis/diagnosis and reporting

#### example_of_use
Card transactions are subjected to an array of fraud pattern test to detect 'out of pattern' behavior - anomalies are highlighted for analysis

#### triggered_by
- Payment Order
- Card Clearing
- Current Account
- Fraud Evaluation
- Credit Management
- Card Authorization
- Underwriting
- Transaction Authorization

#### triggers
- Fraud Evaluation
- Fraud Model

#### list_of_scenarios
- Process Card Clearing by Issuer (views/view_55194.html)
- Authorise Card Use by Acquirer (views/view_55588.html)
- Process Card Clearing by Acquirer (views/view_55404.html)
- Handle Request for Credit Facility (views/view_55481.html)
- Handle Incoming Request for Payment at Debtor Bank (views/view_55467.html)
- Authorise Card Use by Issuer (views/view_55275.html)
- Perform Underwriting for Corporate Loan (views/view_55254.html)
- Handle Request for Payment at Creditor Bank for External Account (views/view_55356.html)
- Perform Underwriting for Syndicated Loan (views/view_55248.html)
- Perform Underwriting Light for Buy Now Pay Later (views/view_55191.html)
- Perform Underwriting for Mortgage Loan (views/view_55392.html)
- Perform Underwriting for Uncollateralised Consumer Loan (views/view_55410.html)
- Perform Underwriting for Renewal of Uncollateralised Consumer Loan (views/view_54892.html)
- Perform Underwriting for Merchandising Loan (views/view_54854.html)
- Handle Request for Outgoing Credit Transfer Related to Request to Pay at Debtor Bank (views/view_54799.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/FraudEvaluation/12.0.0

### Fraud Model

#### role_definition
Analyze history of transactions and fraud cases to discern fraud patterns and develop Rule sets, Decision Trees, and Machine Learning/Predictive models to identify out of pattern transactions or events and their fraud risk score. Support the use of these models and rules in different production contexts and refine the models in response to new and changing patterns

#### core_business_object
Fraud Model

#### key_features
- Determine desired type/coverage for fraud analysis
- Source, define and develop fraud models
- Publish, process feedback and refine/tune models

#### example_of_use
A customer "fraudulent card use' algorithm is updated to take account of additional transaction utilization data that is available

#### triggered_by
- Fraud Evaluation

#### triggers
- Not explicitly specified in the source document

#### list_of_scenarios
- Process Card Clearing by Issuer (views/view_55194.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/FraudModel/12.0.0

### Fraud Resolution

#### role_definition
Setup and update Fraud Case and handle investigation and resolution steps, which may involve initiating containment actions, obtaining documentation, performing forensic investigation and actions, determining liability, initiating resolution actions such as reversals and financial adjustments, subscribing and publishing to Consortia, determining root cause and initiating corrective/preventive actions. The Fraud Case may be opened by Product/Channel Facility, Fraud Diagnosis or by Customer Case.

#### core_business_object
Fraud Case

#### key_features
- Setup fraud resolution case
- Obtain documentation and evaluate
- Determine and assign liability
- Define and initiate resolution activities

#### example_of_use
A pattern of possible fraud is highlighted in transaction records that is researched and evidence of fraud discovered. Prosecution/resolution activity is initiated

#### triggered_by
- Contact Handler

#### triggers
- Not explicitly specified in the source document

#### list_of_scenarios
- Service Role: Review, diagnose and respond to detected production activity that has been identified as potential fraud/AML behavior

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/FraudResolution/12.0.0
