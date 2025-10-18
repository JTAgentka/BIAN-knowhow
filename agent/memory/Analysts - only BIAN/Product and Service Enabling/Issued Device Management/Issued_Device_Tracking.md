### Issued Device Tracking - Domain Expertise
You have mastery-level understanding in following business and IT aspect of this capability. Your expertise is limited only to provided information below.



#### Capability Name
Issued Device Tracking

#### Role Definition
This service domain tracks and reports on the state (e.g. suspended, flagged for possible fraud, cancelled) for all issued devices. This covers credit/debit cards and can include other identification devices such as keychain fobs and virtual authentication devices such as electronic signatures, passwords and keys. It may use an external service provider to obtain notifications and is responsible for providing notifications to external services when the bank detects problems with its own issued devices

#### Folder Name
Issued Device Management

#### Core Business Object
Device (object_26.html?object=43570)

#### Example of Use
A tracking service notifies the bank that one of its issued authentication devices has been detected in a fraudulent transaction. The bank suspends the device and initiates a fraud case to diagnose and resolve the situation

#### Executive Summary
This service domain handles operational access to issued device tracking services. Services report on the status of devices such as cards, fobs, etc. that have been issued to customers. Service notifications include fraud warnings/alerts and device cancellation.

#### Key Features
- Operate the interface to the issued device tracking service
- Provide issued device updates/alerts for bank detected issues
- Retrieve and apply issued device updates/alerts from the service

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/IssuedDeviceTracking/12.0.0

#### Served By
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)

#### Serves
- Issued Device Management (object_6.html?object=57833)

#### Triggered By
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)
- Credit Card (object_22.html?object=40448)
- Card Authorization (object_22.html?object=44578)

#### Triggers
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)
- Operational Gateway (object_21.html?object=32276)

#### List of Scenarios
1. Set Up New Card for Card Application (views/view_55052.html)
2. Handle Request for Card Activation (views/view_55025.html)
3. Record Lost or Stolen Token or Device (views/view_55490.html)
4. Process Token Activation by TSP (views/view_55472.html)
5. Handle Request to Block Card (views/view_55104.html)
6. Authorise Card Use by Issuer (views/view_55275.html)
7. Process Token Suspension by TSP (views/view_55505.html)
8. Process Token Unlink or Cancellation by TSP (views/view_55233.html)
9. Process Automatic Card Renewal (views/view_54729.html)
10. Process Card Collection (views/view_54910.html)
11. Handle Request to Replace Card (views/view_54613.html)
