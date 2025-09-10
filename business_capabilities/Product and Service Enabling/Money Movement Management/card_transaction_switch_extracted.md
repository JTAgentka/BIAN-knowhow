# Card Transaction Switch - BIAN Capability Extract

| Field | Value |
|-------|-------|
| **Capability Name** | Card Transaction Switch |
| **Folder Name** | Money Movement Management |
| **Role Definition** | This service domain handles the processing and asynchronous switching of Card Transaction related messages, such as Authorization, Sale, Void, Refund, etc. between the Acquiring Bank and the Issuing Bank through the Card Network. It has a role within the Acquiring Bank in switching transactions acquired from the Merchant to the Card Network, within the Card Network to switch the transaction to the applicable Card Issuer, and within the Card Issuer to switch the transaction to the instance of the Card Authorization service domain for the card product involved. |
| **Core Business Object** | Card Transaction Switch |
| **Example of Use** | An authorization request or sale transaction message is received from the Point of Sale device by the Acquiring Bank, which then needs to route the message to the Card Issuing Bank through the Card Network (e.g. Visa, MC, AMEX or Diners etc.), await the response from the Card Issuer and communicate it to the Merchant through the Point of Sale device. |
| **Executive Summary** | This service domain orchestrates the switching and routing of Card Authorization and Financial transactions received through the Card POS Network, Card E-Commerce Gateway, or the ATM Network from the Acquirer to the Issuer through the Card Networks. |
| **Key Features** | • Card transaction capture<br>• Card transaction routing |
| **API BIAN Portal Link** | https://app.swaggerhub.com/apis/BIAN-3/CardTransactionSwitch/12.0.0 |
| **Served By** | • Card Transaction Switch<br>• Card Authorization |
| **Serves** | • Money Movement Management |
| **Triggered By** | • Card Transaction Switch<br>• Card Authorization |
| **Triggers** | • Card Transaction Switch<br>• Operational Gateway<br>• Card Network Participant Facility<br>• Card Authorization |
| **List of Scenarios** | • Authorise Card Use by Acquirer<br>• Authorise Card Use by Issuer<br>• Authorise Card Use by Card Network |