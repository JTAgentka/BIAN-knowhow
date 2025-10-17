### Advanced Voice Services Management

#### role_definition
Handles the oversight and configuration of the PBX (telephony/voice) access channel. This includes assessing capacity, performance, scheduling maintenance and updates to the channel configuration. Also determining allowed access and usage and troubleshooting major production problems

#### core_business_object
Voice Channel (object_26.html?object=44999)

#### key_features
- Determine the required voice channel platform configuration
- Oversee platform upgrades and maintenance
- Track service availability and troubleshoot major production issues

#### example_of_use
Management review and define the reconfiguration requirements for the voice channel based on capacity/volume projections

#### triggered_by
- Contact Center Operations (object_22.html?object=43894)

#### triggers
(empty)

#### list_of_scenarios
- Adjust Call Centre Position Assignments (views/view_55380.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/AdvancedVoiceServicesManagement/12.0.0

---

### eBranch Operations

#### role_definition
This service domain operates the E-branch production systems conforming to planned service schedules. It handles customer and non-customer access checks, performs device load balancing and device failure and recovery handling - typically supporting a high performance 24/7 operation. It can include the integration of computer telephony integration (CTI) with branch and call center channels

#### core_business_object
EBranchChannelSession

#### key_features
- Operate the bank's e-branch internet platform
- Support access to the bank's public website
- Support customer registration and log-in services
- Route customer contacts for servicing

#### example_of_use
customers and non-bank customers browse the products and services available at the bank

#### triggered_by
- Customer Workbench (object_21.html?object=34733)
- Contact Handler (object_20.html?object=41839)

#### triggers
- Issued Device Administration (object_21.html?object=30905)
- Customer Workbench (object_21.html?object=34733)
- Customer Position (object_22.html?object=41136)
- Contact Handler (object_20.html?object=41839)

#### list_of_scenarios
- EXT Handle Request for Overdraft Limit on Virtual Account (views/view_55055.html)
- EXT Handle Request to Add Account to Sweep Agreement (views/view_55061.html)
- EXT Handle Request to Move Overdraft Limit between Virtual Accounts (views/view_54989.html)
- EXT Handle Request for High Volume Account Opening (views/view_54681.html)
- 2 - Retrieve a list of connected ASPSB banks (views/view_46375.html)
- Handle Customer Request for User Access Token Using Bank Authorization Grant and its Client Secret within Active Contact (views/view_54913.html)
- Create Customer Reports (views/view_55419.html)
- EXT Handle Merchandising Loan Application (views/view_55092.html)
- EXT Handle Request to Open Retail Current Account (views/view_55487.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/eBranchOperations/12.0.0

---

### Advanced Voice Services Operations

#### role_definition
This service domain handles the operation of the PBX/telephony infrastructure which can include embedded IVR capabilities. The PBX system will have close integration with the call center and E-Branch capabilities depending on the degree of computer telephony integration (CTI) and cross channel support

#### core_business_object
Voice Channel Session (object_26.html?object=36697)

#### key_features
- Handle in-bound customer voice contacts
- Provide out bound voice connections voice
- Handle service issue reporting and resolution

#### example_of_use
The numeric menu is adjusted to increase self-serve activity during a period of peak loading (this could be implemented in the IVR in a more sophisticated set-up)

#### triggered_by
- Servicing Order (object_21.html?object=32295)
- Point of Service (object_22.html?object=43170)

#### triggers
- Contact Handler (object_20.html?object=41839)

#### list_of_scenarios
- Develop Opportunity (views/view_55143.html)
- Handle Failed Self Service Product Application (views/view_54810.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/AdvancedVoiceServicesOperations/12.0.0

---

### Interactive Help

#### role_definition
Operate the automated facility that provides interactive help and guidance for servicing to employees and self-service customers. The facility automatically determines the context for the help request and selects stored guidance that is presented to the user. The initial selection can be dynamically refined by the user to focus in on specific requirements as necessary. User feedback as to the content and coverage of the guidance can be captured

#### core_business_object
Interactive Help Service (object_26.html?object=47912)

#### key_features
- Maintain context specific guidance
- Select and present context specific guidance
- Refine guidance selection criteria
- Capture feedback with regard to guidance coverage and usability/quality

#### example_of_use
A new customer servicing representative obtains guidance for a product fulfillment issue raised during a customer contact

#### triggered_by
(empty)

#### triggers
(empty)

#### list_of_scenarios
(empty)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/InteractiveHelp/12.0.0

---

### Branch Portfolio

#### role_definition
Evaluate coverage and relative performance of branches. Optimize product allocation and marketing activity across the available branch network.

#### core_business_object
Branch Network Analysis (object_24.html?object=132919)

#### key_features
- Branch network analysis and evaluation
- Product allocation optimization
- Marketing activity optimization across branch network
- Performance comparison and coverage assessment

#### example_of_use
Business strategists assemble and review the distribution and relative product performance across the network and adjust the allocation accordingly

#### triggered_by
(empty)

#### triggers
(empty)

#### list_of_scenarios
(empty)

#### api_bian_portal_link
Not specified

---

### Channel Portfolio

#### role_definition
Evaluate the coverage and relative performance of different channels with respect to the blend of service and product activity. Optimize channel use to minimize costs and enhance customer experience

#### core_business_object
Channel Portfolio Analysis (object_24.html?object=115838)

#### key_features
- Channel coverage evaluation
- Performance analysis across different channels
- Channel optimization for cost minimization
- Customer experience enhancement through channel optimization

#### example_of_use
Product designers review the performance of products over different channels and channel combinations to refine product designs and delivery

#### triggered_by
(empty)

#### triggers
(empty)

#### list_of_scenarios
(empty)

#### api_bian_portal_link
Not specified

---

### Branch Location Operations

#### role_definition
Administer the day to day activity within the branch - allocating tellers and customer relationship managers to positions and tracking availability/performance, ensuring cash floats and product consumables are on hand and that all facilities are in working order

#### core_business_object
Not specified

#### key_features
- Staff assignments
- Cash and non-cash movements within the branch
- Safe custody service operation
- Location security operations

#### example_of_use
Branch staff administration assigns teller positions and relationship management tasks to the branch workforce based on ongoing demand

#### triggered_by
- Branch Currency Distribution (object_21.html?object=33904)
- Branch Location Operations (object_21.html?object=34007)
- Branch Location Management (object_21.html?object=35932)

#### triggers
- Central Cash Handling (object_20.html?object=29997)
- Branch Location Operations (object_21.html?object=34007)
- Point of Service (object_22.html?object=43170)

#### list_of_scenarios
- Process Inventory of Cash and Distribution of Cash to Branches (views/view_55113.html)
- Review Branch Location Performance (views/view_55272.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/BranchLocationOperations/12.0.0

---

### Channel Activity Analysis

#### role_definition
Channel activity analysis provides a range of analytical insights into channel use to support access controls, relationship sales and development approaches and to help detect possible fraudulent activity

#### core_business_object
Not explicitly mentioned in the document

#### key_features
- Analyze activity for potential customer fraud
- Analyze activity for potential merchant fraud
- Analyze activity for relationship development
- Detect device errors and 'bot' access attempts

#### example_of_use
A customer attempts to self-serve a product sale but gives up. Later they call the contact center and their recent attempt is used to route the contact to a sales rep who is prompted to continue the product application

#### triggered_by
- Servicing Order (object_21.html?object=32295)
- Processing Order (object_20.html?object=33179)
- Channel Activity Analysis (object_21.html?object=34254)
- eBranch Management (object_21.html?object=34844)
- Contact Handler (object_20.html?object=41839)

#### triggers
- Channel Activity Analysis (object_21.html?object=34254)
- Channel Activity History (object_21.html?object=38870)
- Customer Behavior Models (object_22.html?object=41791)

#### list_of_scenarios
- Process Authentication Request by Issuer (views/view_54669.html)
- Flag Bots Acting as Customers or TPPs (views/view_55049.html)
- Handle Request for Token Assurance (views/view_54761.html)
- Review Use of Products and Services Via eBranch (views/view_54778.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ChannelActivityAnalysis/12.0.0
