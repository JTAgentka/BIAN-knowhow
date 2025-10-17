### Issued Device Administration - Domain Expertise
You have mastery-level understanding in following business and IT aspect of this capability. Your expertise is limited only to provided information below.



#### Capability Name
Issued Device Administration

#### Role Definition
This service domain administers the inventory management and allocation/issuance for all issued devices and materials (e.g. cards). This covers credit/debit cards and can include other identification/authentication devices such as keychain fobs. It also handles virtual token inventory such as passwords, secret questions and biometric records (signatures, voice/image). An aspect of the administration includes maintaining device reference details and states such as operating system release and age/duration in use. Specific product/service access permissions can be associated with an issued device

#### Folder Name
Issued Device Management

#### Core Business Object
IssuedDeviceAllocationSystem

#### Example of Use
A card is cancelled and a replacement card is generated and issued for a customer reporting a stolen card

#### Executive Summary
This service domain administers the issuance of authentication tokens to customers and third party service providers. Tokens here include physical devices such as cards, fobs, readers and intangible 'devices' such as passwords and secret questions. Administration includes version tracking, replacement and duration/frequency limits. Specific product/service access permissions may be associated with an issued token when appropriate

#### Key Features
- Administer the issuance/set-up/registration of authentication devices
- Maintain/update issued device status
- Maintain/update permissions associated with issued devices
- Process issued device status updates/alerts

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/IssuedDeviceAdministration/12.0.0

#### Served By
- Financial Gateway (object_20.html?object=29241)
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)
- Correspondence (object_20.html?object=32927)
- Contractor and Supplier Agreement (object_21.html?object=37515)
- Fraud Evaluation (object_22.html?object=39639)
- Systems Operations (object_22.html?object=41350)
- Session Dialogue (object_23.html?object=48273)

#### Serves
- Issued Device Management (object_6.html?object=57833)

#### Triggered By
- Party Lifecycle Management (object_20.html?object=29780)
- Issued Device Tracking (object_20.html?object=30205)
- eBranch Operations (object_21.html?object=30829)
- Issued Device Administration (object_21.html?object=30905)
- Servicing Order (object_21.html?object=32295)
- Processing Order (object_20.html?object=33179)
- Corporate Current Account (object_21.html?object=34221)
- Current Account (object_21.html?object=37122)
- Savings Account (object_21.html?object=38858)
- Credit Card (object_22.html?object=40448)
- Party Authentication (object_22.html?object=40912)
- Contact Handler (object_20.html?object=41839)
- Brokered Product (object_20.html?object=42491)
- Virtual Account (object_22.html?object=45513)
- Session Dialogue (object_23.html?object=48273)
- Product Fulfillment SDs (object_25.html?object=83652)

#### Triggers
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)
- Correspondence (object_20.html?object=32927)
- Product Broker Agreement (object_22.html?object=40829)

#### List of Scenarios
1. Set Up New Card for Card Application (views/view_55052.html)
2. 9 - Update status of the consent to authorized and get authentication code (views/view_39389.html)
3. Handle Request for Card Activation (views/view_55025.html)
4. Process Authentication Request by Issuer (views/view_54669.html)
5. Execute Customer Onboarding API version (views/view_54883.html)
6. Handle Customer Request for User Access Token Using Bank Authorization Grant and its Client Secret within Active Contact (views/view_54913.html)
7. Process Card Account Delinquency Review (views/view_55269.html)
8. Handle Request to Close Savings Account (views/view_55416.html)
9. EXT Handle Request to Open Retail Current Account (views/view_55487.html)
10. Handle Request to Open Savings Account (views/view_55628.html)
11. Record Lost or Stolen Token or Device (views/view_55490.html)
12. Process Update of Token Attributes by TSP (views/view_55311.html)
13. Process Contact setup and start TPP Servicing Dialogue (views/view_55305.html)
14. Process Token Activation by TSP (views/view_55472.html)
15. Process Transaction Booking (views/view_55666.html)
16. EXT Handle Bulk Request for Opening Salary Accounts (views/view_55326.html)
17. Handle Request to Block Card (views/view_55104.html)
18. Handle Servicing Request for Access Attempt with out of Pattern Customer or TPP Behaviour (views/view_55532.html)
19. Handle TPP Request for Registration with Bank and Exchange of 'Client Identifier' and 'Client Secret' for Later Reference (views/view_55320.html)
20. Handle Request to Open Retail Current Account (views/view_55365.html)
21. Process Token Suspension by TSP (views/view_55505.html)
22. Handle Request to Close Corporate Current Account (views/view_55308.html)
23. Process Token Unlink or Cancellation by TSP (views/view_55233.html)
24. Process Access Request by TPP on Behalf of Customer (views/view_55437.html)
25. EXT Handle Request to Close Virtual Account (views/view_55455.html)
26. Handle Bulk Request for Opening Salary Accounts (views/view_55131.html)
27. EXT Handle Request to Close Corporate Current Account (views/view_55101.html)
28. 4a - Get and store authentication token, trigger a request to transfer account (views/view_32684.html)
29. 1 - Initiate Consent (views/view_39366.html)
30. 4 - Customer log-in (views/view_38593.html)
31. 3 - Initiate Consent (views/view_44841.html)
32. Handle Request to Close Retail Current Account (views/view_54846.html)
33. 6&7 - Retrieve accounts and consent details (views/view_35037.html)
34. 2 - Create account consent (views/view_48501.html)
35. Handle Customer Request to Log On to Bank to Authenticate and to Authorise Client Access to Their Account (views/view_54928.html)
36. Process Customer Access Request and Authentication (views/view_54634.html)
37. 3 - Periodically the TPP Bank Request Account Updates (views/view_54916.html)
38. Process Automatic Card Renewal (views/view_54729.html)
39. Handle Customer Request for Payment Order during Active Mobile Access Session (views/view_55010.html)
40. 8 - Save selected accounts (views/view_35560.html)
41. 10 - Get access token, refresh access token (views/view_35507.html)
42. 11 - Get list of customer accounts (views/view_30521.html)
43. Handle Request for Token Assurance (views/view_54761.html)
44. Handle Request for Corporate Debit Cards Service (views/view_55428.html)
45. Process Cancellation of Debit Card Service of Corporate Current Account to be Closed (views/view_55386.html)
46. EXT Handle request for Corporate Debit Cards Service (views/view_55446.html)
47. Handle Request to Replace Card (views/view_54613.html)
