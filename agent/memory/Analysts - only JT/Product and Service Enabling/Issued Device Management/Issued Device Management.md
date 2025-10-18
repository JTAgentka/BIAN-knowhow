### Issued Device Tracking

#### role_definition
This service domain tracks and reports on the state (e.g. suspended, flagged for possible fraud, cancelled) for all issued devices. This covers credit/debit cards and can include other identification devices such as keychain fobs and virtual authentication devices such as electronic signatures, passwords and keys. It may use an external service provider to obtain notifications and is responsible for providing notifications to external services when the bank detects problems with its own issued devices

#### core_business_object
Device (object_26.html?object=43570)

#### key_features
- Operate the interface to the issued device tracking service
- Provide issued device updates/alerts for bank detected issues
- Retrieve and apply issued device updates/alerts from the service

#### example_of_use
A tracking service notifies the bank that one of its issued authentication devices has been detected in a fraudulent transaction. The bank suspends the device and initiates a fraud case to diagnose and resolve the situation

#### triggered_by
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)
- Credit Card (object_22.html?object=40448)
- Card Authorization (object_22.html?object=44578)

#### triggers
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)
- Operational Gateway (object_21.html?object=32276)

#### list_of_scenarios
- Set Up New Card for Card Application (views/view_55052.html)
- Handle Request for Card Activation (views/view_55025.html)
- Record Lost or Stolen Token or Device (views/view_55490.html)
- Process Token Activation by TSP (views/view_55472.html)
- Handle Request to Block Card (views/view_55104.html)
- Authorise Card Use by Issuer (views/view_55275.html)
- Process Token Suspension by TSP (views/view_55505.html)
- Process Token Unlink or Cancellation by TSP (views/view_55233.html)
- Process Automatic Card Renewal (views/view_54729.html)
- Process Card Collection (views/view_54910.html)
- Handle Request to Replace Card (views/view_54613.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/IssuedDeviceTracking/12.0.0

##### IT details
- REST APIs:  Card
- Key API Operations: 
    STav karty
- Event Streams:  
    JTB-CZ_CARDS_CARD-STATUS_SYNC_GNR
    JTB-SK_CARDS_CARD-STATUS_SYNC_GNR
- Core System: NEXI, Card Gateway 
- Data Objects:  CardLimit
- Key Systems flow: NEXI -> CGW -> ESBW -> QST -> EI KAFKA -> DKCZ/DKSK
- Data Quality: poor - multiple hops with asyn and sync integration. Make very difficult to rely on data.

---

### Issued Device Administration

#### role_definition
This service domain administers the inventory management and allocation/issuance for all issued devices and materials (e.g. cards). This covers credit/debit cards and can include other identification/authentication devices such as keychain fobs. It also handles virtual token inventory such as passwords, secret questions and biometric records (signatures, voice/image). An aspect of the administration includes maintaining device reference details and states such as operating system release and age/duration in use. Specific product/service access permissions can be associated with an issued device

#### core_business_object
IssuedDeviceAllocationSystem

#### key_features
- Administer the issuance/set-up/registration of authentication devices
- Maintain/update issued device status
- Maintain/update permissions associated with issued devices
- Process issued device status updates/alerts

#### example_of_use
A card is cancelled and a replacement card is generated and issued for a customer reporting a stolen card

#### triggered_by
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

#### triggers
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)
- Correspondence (object_20.html?object=32927)
- Product Broker Agreement (object_22.html?object=40829)

#### list_of_scenarios
- Set Up New Card for Card Application (views/view_55052.html)
- 9 - Update status of the consent to authorized and get authentication code (views/view_39389.html)
- Handle Request for Card Activation (views/view_55025.html)
- Process Authentication Request by Issuer (views/view_54669.html)
- Execute Customer Onboarding API version (views/view_54883.html)
- Handle Customer Request for User Access Token Using Bank Authorization Grant and its Client Secret within Active Contact (views/view_54913.html)
- Process Card Account Delinquency Review (views/view_55269.html)
- Handle Request to Close Savings Account (views/view_55416.html)
- EXT Handle Request to Open Retail Current Account (views/view_55487.html)
- Handle Request to Open Savings Account (views/view_55628.html)
- Record Lost or Stolen Token or Device (views/view_55490.html)
- Process Update of Token Attributes by TSP (views/view_55311.html)
- Process Contact setup and start TPP Servicing Dialogue (views/view_55305.html)
- Process Token Activation by TSP (views/view_55472.html)
- Process Transaction Booking (views/view_55666.html)
- EXT Handle Bulk Request for Opening Salary Accounts (views/view_55326.html)
- Handle Request to Block Card (views/view_55104.html)
- Handle Servicing Request for Access Attempt with out of Pattern Customer or TPP Behaviour (views/view_55532.html)
- Handle TPP Request for Registration with Bank and Exchange of 'Client Identifier' and 'Client Secret' for Later Reference (views/view_55320.html)
- Handle Request to Open Retail Current Account (views/view_55365.html)
- Process Token Suspension by TSP (views/view_55505.html)
- Handle Request to Close Corporate Current Account (views/view_55308.html)
- Process Token Unlink or Cancellation by TSP (views/view_55233.html)
- Process Access Request by TPP on Behalf of Customer (views/view_55437.html)
- EXT Handle Request to Close Virtual Account (views/view_55455.html)
- Handle Bulk Request for Opening Salary Accounts (views/view_55131.html)
- EXT Handle Request to Close Corporate Current Account (views/view_55101.html)
- 4a - Get and store authentication token, trigger a request to transfer account (views/view_32684.html)
- 1 - Initiate Consent (views/view_39366.html)
- 4 - Customer log-in (views/view_38593.html)
- 3 - Initiate Consent (views/view_44841.html)
- Handle Request to Close Retail Current Account (views/view_54846.html)
- 6&7 - Retrieve accounts and consent details (views/view_35037.html)
- 2 - Create account consent (views/view_48501.html)
- Handle Customer Request to Log On to Bank to Authenticate and to Authorise Client Access to Their Account (views/view_54928.html)
- Process Customer Access Request and Authentication (views/view_54634.html)
- 3 - Periodically the TPP Bank Request Account Updates (views/view_54916.html)
- Process Automatic Card Renewal (views/view_54729.html)
- Handle Customer Request for Payment Order during Active Mobile Access Session (views/view_55010.html)
- 8 - Save selected accounts (views/view_35560.html)
- 10 - Get access token, refresh access token (views/view_35507.html)
- 11 - Get list of customer accounts (views/view_30521.html)
- Handle Request for Token Assurance (views/view_54761.html)
- Handle Request for Corporate Debit Cards Service (views/view_55428.html)
- Process Cancellation of Debit Card Service of Corporate Current Account to be Closed (views/view_55386.html)
- EXT Handle request for Corporate Debit Cards Service (views/view_55446.html)
- Handle Request to Replace Card (views/view_54613.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/IssuedDeviceAdministration/12.0.0


##### IT details
- REST APIs:  CardDetail, CardLimit, Card
- Key API Operations: 
    Detail karty, Změna limitu na kartě, Nastavení 3DS kontaktu, Bezkontaktní funkce (kontaktless on/off), Tokenizace karty (Apple Pay, Google Pay)
- Event Streams:  
    JTB-CZ_CARDS_CARD-LIMIT_SYNC_GNR
    JTB-SK_CARDS_CARD-LIMIT_SYNC_GNR
    JTB-CZ_CARDS_CARD-TOKEN_SYNC_GNR
    JTB-SK_CARDS_CARD-TOKEN_SYNC_GNR
- Core System: NEXI, Card Gateway 
- Data Objects:  CardLimit
- Key Systems flow: NEXI -> CGW -> ESBW -> QST -> EI KAFKA -> DKCZ/DKSK
- Data Quality: poor - multiple hops with asyn and sync integration. Make very difficult to rely on data.


