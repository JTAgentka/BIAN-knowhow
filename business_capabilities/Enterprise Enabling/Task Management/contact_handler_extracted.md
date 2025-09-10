# Contact Handler - BIAN Capability

## 1. Capability Name
Contact Handler

## 2. Role Definition
BIAN defines a customer contact as the overarching structure handling a customer interaction from start to end. A contact can include one or more servicing dialogue 'sessions' in parallel or sequence to support different device/channel uses within the contact and to allow for the customer to be passed on to different servicing specialists as necessary during the contact. Each session is handled at a servicing position where the Contact Dialogue service domain is called to handle the specific customer interaction. Contact Handler concludes the contact, handles the authorization permissions and shares any contact information collected during the contact between sessions as necessary.

## 3. Folder Name
Task Management

## 4. Core Business Object
CustomerContactSession

## 5. Example of Use
A customer is self serving on the web and then requests to talk to a servicing representative directory using the VoIP capability presented on the banks web portal.

## 6. Executive Summary
This service domain handles a customer's interactive contact with the bank. This will typically involve launching of one or more channel/device specific dialogue sessions as necessary within the customer contact.

## 7. Key Features
- Handle customer contacts with the bank
- Obtain customer identity authentication
- Consolidate reference information and recent contact activity details
- Obtain routing decision (select optimal servicing resource)
- Initiate servicing sessions
- Log contact activity

## 8. API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/ContactHandler/12.0.0

## 9. Served By
- eBranch Operations
- Business Unit Management
- Business Development
- Advanced Voice Services Operations
- Session Dialogue

## 10. Serves
- Task Management

## 11. Triggered By
- eBranch Operations
- Advanced Voice Services Operations
- Contact Handler
- Brokered Product
- Session Dialogue

## 12. Triggers
- Party Lifecycle Management
- Customer Access Entitlement
- eBranch Operations
- Issued Device Administration
- Party Routing Profile
- Channel Activity Analysis
- Customer Workbench
- Servicing Mandate
- Channel Activity History
- Party Authentication
- Contact Routing
- Customer Position
- Contact Handler
- Point of Service
- Fraud Resolution
- Party Reference Data Directory
- Service Directory
- Session Dialogue
- Transaction Authorization

## 13. List of Scenarios with Links

### Account Management Scenarios
- [EXT Handle Request for Overdraft Limit on Virtual Account](views/view_55055.html)
- [EXT Handle Request to Add Account to Sweep Agreement](views/view_55061.html)
- [EXT Handle Request to Move Overdraft Limit between Virtual Accounts](views/view_54989.html)
- [EXT Handle Request for High Volume Account Opening](views/view_54681.html)
- [EXT Handle Request to Open Retail Current Account](views/view_55487.html)
- [EXT Handle Request to Reactivate Dormant Corporate Current Account](views/view_55347.html)
- [EXT Handle Request to Change Corporate Current Account Ownership](views/view_55493.html)
- [EXT Handle Request to Pre-Open Corporate Current Account](views/view_55077.html)
- [EXT Handle Request to Add Signatory to Corporate Current Account](views/view_55296.html)
- [EXT Handle Bulk Request for Opening Salary Accounts](views/view_55326.html)
- [EXT Handle Request to Terminate Sweep Agreement](views/view_55499.html)
- [EXT Handle Request to Change Virtual Account Ownership](views/view_55562.html)
- [EXT Handle Request to Close Virtual Account](views/view_55455.html)
- [EXT Handle Request for High Volume Virtual Account Opening](views/view_55266.html)
- [EXT Handle Request to Close Corporate Current Account](views/view_55101.html)

### Authentication and Access Scenarios
- [Update status of the consent to authorized and get authentication code](views/view_39389.html)
- [Handle Customer Request for User Access Token Using Bank Authorization Grant and its Client Secret within Active Contact](views/view_54913.html)
- [Handle Servicing Request for Access Attempt with out of Pattern Customer or TPP Behaviour](views/view_55532.html)
- [Handle TPP Request for Registration with Bank and Exchange of 'Client Identifier' and 'Client Secret' for Later Reference](views/view_55320.html)
- [Process Access Request by TPP on Behalf of Customer](views/view_55437.html)
- [Handle Customer Request to Log On to Bank to Authenticate and to Authorise Client Access to Their Account](views/view_54928.html)
- [Check Customer Channel Access History and Access Entitlements](views/view_54968.html)
- [Process Customer Access Request and Authentication](views/view_54634.html)

### Transaction and Payment Scenarios
- [EXT Handle Request to Use Direct Debits as Payment Instrument](views/view_55260.html)
- [EXT Process B2B Direct Debit Mandate Notice from Creditor Bank at Debtor Bank](views/view_55425.html)
- [EXT Handle Instruction to Terminate B2B Direct Debits Service at Creditor Bank](views/view_55440.html)
- [Handle Customer Request for Payment Order during Active Mobile Access Session](views/view_55010.html)
- [EXT Handle Request to Establish Credit Transfer Standing Order on Corporate Current Account](views/view_54951.html)
- [EXT Record Core SEPA Direct Debit Mandate at Creditor Bank](views/view_54744.html)

### Customer Service and Support Scenarios
- [Create Customer Reports](views/view_55419.html)
- [Execute Interactive Retention Campaign](views/view_55098.html)
- [EXT Handle Customer Relationships Case](views/view_55529.html)
- [Process Contact setup and start TPP Servicing Dialogue](views/view_55305.html)
- [Develop Opportunity](views/view_55143.html)
- [Handle Failed Self Service Product Application](views/view_54810.html)

### Account Information and Statement Scenarios
- [Get Customer Request and Show Account Balance](views/view_55475.html)
- [EXT Handle Request for Combined Account Statement](views/view_55637.html)
- [EXT Handle Request for Account Statement and Outgoing Credit Transfer](views/view_54747.html)
- [EXT Handle Request for Account Statement and Balances](views/view_54631.html)
- [Get Customer account details](views/view_36796.html)
- [Get customer account beneficiaries](views/view_46252.html)
- [Get customer account balances](views/view_30223.html)
- [Get customer account transactions](views/view_39221.html)
- [Get list of customer accounts](views/view_30521.html)

### Loan and Credit Scenarios
- [EXT Handle Merchandising Loan Application](views/view_55092.html)
- [EXT Handle Request for Renewal of Uncollateralised Consumer Loan](views/view_55034.html)
- [EXT Handle Request for Modification of Merchandising Loan](views/view_54708.html)

### Term Deposit Scenarios
- [EXT Handle Request to Open Term Deposit Agreement for Retail Customer](views/view_55007.html)
- [EXT Handle Request to Change Term Deposit Agreement Conditions](views/view_54971.html)
- [EXT Handle Request to Open Term Deposit under Term Deposit Agreement for Retail Customer](views/view_55547.html)
- [EXT Handle Request to Change Term Deposit Attached Corporate Current Account](views/view_55610.html)
- [EXT Handle Request to Open Term Deposit under Term Deposit Agreement for Corporate Customer](views/view_55209.html)
- [EXT Handle Request to Establish Term Deposit Agreement](views/view_54702.html)
- [EXT Handle Request for Early Closing of Term Deposit](views/view_54863.html)
- [EXT Handle Request for Early Renewal of Term Deposit](views/view_54866.html)

### Corporate Services Scenarios
- [EXT Handle request for Corporate Debit Cards Service](views/view_55446.html)
- [EXT Handle Request to Detach Account from Corporate Payroll Service Agreement](views/view_54714.html)
- [EXT Handle Request for Preferential Rates for Corporate Current Account](views/view_54889.html)
- [EXT Handle Request to Open Corporate Current Account](views/view_54675.html)

### Technical and System Scenarios
- [Retrieve a list of connected ASPSB banks](views/view_46375.html)
- [Get and store authentication token, trigger a request to transfer account](views/view_32684.html)
- [Initiate Consent](views/view_39366.html)
- [Initiate consent authorization](views/view_48589.html)
- [Customer log-in](views/view_38593.html)
- [Retrieve accounts and consent details](views/view_35037.html)
- [End Mobile Access Session and Update Event and Servicing and Channel History](views/view_54816.html)
- [Create account consent](views/view_48501.html)
- [EXT Handle Request to Change Sweep Sequence](views/view_54834.html)
- [Periodically the TPP Bank Request Account Updates](views/view_54916.html)
- [Save selected accounts](views/view_35560.html)
- [Get access token, refresh access token](views/view_35507.html)
- [EXT Handle Request to Open Virtual Account](views/view_54790.html)
- [Retrieve a list of ASPSB banks from the OB Directory](views/view_42714.html)
- [Exchange OTP](views/view_41381.html)

### Customer Experience Scenarios
- [Customer Sees the NBP Offer and Decides if to Apply](views/view_55585.html)