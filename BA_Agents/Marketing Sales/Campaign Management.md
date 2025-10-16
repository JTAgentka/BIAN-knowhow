### Prospect Campaign Management

#### role_definition
Oversee the use and assess the coverage and impact of external/prospect campaigns. Direct prospect campaign execution resources to maximize business impact and in response to any identified market opportunities and threats. Oversee campaign design and development activity.

#### core_business_object
Prospect Campaign (object_26.html?object=40891)

#### key_features
- Track market/competitor activity
- Assess customer segment performance/opportunities
- Assess coverage of prospect campaigns
- Direct the development of prospect campaigns
- Direct the execution of prospect campaigns

#### example_of_use
Prospect Campaign Management identifies competitor activity that is targeting an untapped market segment. Campaign design is initiated to develop a competitive acquisition campaign to address the threat

#### triggered_by
- Business Development (object_20.html?object=32900)
- Branch Network Management (object_23.html?object=48774)

#### triggers
- Prospect Campaign Design (object_22.html?object=39556)
- Prospect Campaign Execution (object_22.html?object=47050)

#### list_of_scenarios
- Execute External Campaign (views/view_55170.html)
- Analyse External Campaign Portfolio Performance (views/view_55338.html)
- Review Branch Location Performance (views/view_55272.html)
- Develop External Campaign (views/view_54948.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProspectCampaignManagement/12.0.0

---

### Advertising

#### role_definition
Oversee the use and assess the coverage and impact of advertising campaigns. Direct advertising campaign execution to maximize business impact. Oversee advertising campaign design and development activity.

#### core_business_object
Advertising Campaign Management Plan (object_25.html?object=30184)

#### key_features
- Track market/competitor activity
- Assess customer segment performance
- Assess coverage of advertising campaigns
- Direct the development of advertising campaigns
- Direct the execution of advertising campaigns

#### example_of_use
Business development reviews market research to determine levels of awareness for selected bank products and initiates an advertising campaign to raise awareness

#### triggered_by
- Business Development (object_20.html?object=32900)

#### triggers
- Market Research (object_21.html?object=34938)

#### list_of_scenarios
- Develop Advertising Campaign (views/view_55317.html)
- Analyse Competitor Activity (views/view_54711.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/Advertising/12.0.0

---

### Prospect Campaign Design

#### role_definition
This Service Domain designs and refines prospect campaigns (or integrates designs from external campaign specialists). Prospect campaigns target new customer acquisition and are typically proactive (involving prospect targeting, contact and solicitation). Version numbering is used to track the impact of changes made to campaigns over their usage.

#### core_business_object
Prospect Campaign (object_26.html?object=40891)

#### key_features
- Define the target profile/impact of a campaign
- Specify a prospect campaign
- Track the impact of a campaign
- Refine/reconfigure a campaign

#### example_of_use
A prospect acquisition campaign is updated to provide amended/improved pricing terms that can be offered to targeted prospects poor take-up rate has been detected for the campaign

#### triggered_by
- Prospect Campaign Management (object_21.html?object=32462)
- Business Development (object_20.html?object=32900)
- Prospect Campaign Execution (object_22.html?object=47050)

#### triggers
- Market Research (object_21.html?object=34938)

#### list_of_scenarios
- Execute External Campaign (views/view_55170.html)
- Analyse External Campaign Portfolio Performance (views/view_55338.html)
- Develop External Campaign (views/view_54948.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProspectCampaignDesign/12.0.0

---

### Customer Campaign Management

#### role_definition
Oversee the use and assess the coverage and impact of internal/customer campaigns. Direct customer campaign execution resources to maximize business impact and in response to any identified market opportunities and threats. Oversee campaign design and development activity.

#### core_business_object
Customer Campaign (object_25.html?object=31474)

#### key_features
- Track market/competitor activity
- Assess customer segment performance
- Assess coverage of customer campaigns
- Direct the development of customer campaigns
- Direct the execution of customer campaigns

#### example_of_use
Customer Campaign Management identifies competitor activity that poses a threat to existing customers. Campaign design is initiated to develop a retention campaign to address the threat

#### triggered_by
- Business Development (object_20.html?object=32900)

#### triggers
- Customer Campaign Execution (object_22.html?object=40236)
- Customer Campaign Design (object_22.html?object=47269)

#### list_of_scenarios
- Process Internal Upsell Campaign (views/view_55064.html)
- Execute Internal Campaign (views/view_55350.html)
- Perform Internal Campaign Development (views/view_55520.html)
- Analyse Internal Campaign Portfolio Performance (views/view_54672.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/CustomerCampaignManagement/12.0.0

---

### Prospect Campaign Execution

#### role_definition
Handle the deployment, execution and on-going refinement of a prospect campaign. This includes many types of proactive prospect acquisition campaigns. The campaign execution process performs the initial selection and confirmation/validation of candidate lists and includes providing critical feedback on the impact of the campaign to the design unit to support re-calibration and refinement of the specification based on practical experience

#### core_business_object
Prospect Campaign (object_26.html?object=40891)

#### key_features
- Candidate prospect selection/identification (list development)
- Prospect interaction and response capture
- Campaign performance analysis and feedback

#### example_of_use
A bank implements a targeted take-one mailshot acquisition campaign to attract additional customers

#### triggered_by
- Prospect Campaign Management (object_21.html?object=32462)
- Prospect Campaign Execution (object_22.html?object=47050)

#### triggers
- Party Lifecycle Management (object_20.html?object=29780)
- Correspondence (object_20.html?object=32927)
- Market Analysis (object_21.html?object=36136)
- Prospect Campaign Design (object_22.html?object=39556)
- Prospect Campaign Execution (object_22.html?object=47050)

#### list_of_scenarios
- Execute External Campaign (views/view_55170.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/ProspectCampaignExecution/12.0.0

---

### Customer Campaign Design

#### role_definition
This Service Domain designs and refines customer campaigns (or integrates designs from external campaign specialists). Customer campaigns target the existing customer base and can be proactive (involving customer targeting, contact and solicitation) or self-service and include activities such as cross-sell, up-sell and retention. Version numbering is used to track the impact of changes made to campaigns over their usage.

#### core_business_object
Customer Campaign (object_25.html?object=31474)

#### key_features
- Define the target profile/impact of a campaign
- Specify a customer campaign
- Track the impact of a campaign
- Refine/reconfigure a campaign

#### example_of_use
A retention campaign is updated to provide amended/improved pricing terms that can be offered to targeted customers to help retain their business after a poor response rate has been detected for the campaign

#### triggered_by
- Business Development (object_20.html?object=32900)
- eBranch Management (object_21.html?object=34844)
- Customer Campaign Execution (object_22.html?object=40236)
- Customer Campaign Management (object_22.html?object=46174)

#### triggers
- Market Research (object_21.html?object=34938)

#### list_of_scenarios
- Process Internal Upsell Campaign (views/view_55064.html)
- Execute Internal Campaign (views/view_55350.html)
- Perform Internal Campaign Development (views/view_55520.html)
- Analyse Internal Campaign Portfolio Performance (views/view_54672.html)
- Review Use of Products and Services Via eBranch (views/view_54778.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/CustomerCampaignDesign/12.0.0

---

### Customer Campaign Execution

#### role_definition
Handle the deployment, execution and on-going refinement of a customer campaign. This includes many types of proactive customer campaigns such as up-sell, cross-sell and customer retention. The campaign execution process performs the initial selection and confirmation of candidate customers and includes providing critical feedback on the impact of the campaign to the design unit to support re-calibration and refinement of the specification based on practical experience

#### core_business_object
Not explicitly specified in the document

#### key_features
- Candidate customer selection/identification
- Customer interaction and response capture
- Campaign performance analysis and feedback

#### example_of_use
A bank implements a targeted cross-sell campaign in the customer servicing center to generate additional sales

#### triggered_by
- Customer Relationship Management (object_21.html?object=30437)
- Customer Campaign Execution (object_22.html?object=40236)
- Customer Campaign Management (object_22.html?object=46174)
- Session Dialogue (object_23.html?object=48273)

#### triggers
- Customer Relationship Management (object_21.html?object=30437)
- Party Routing Profile (object_21.html?object=31558)
- Customer Campaign Execution (object_22.html?object=40236)
- Consumer Advisory Services (object_22.html?object=44522)
- Lead and Opportunity Management (object_22.html?object=45446)
- Customer Campaign Design (object_22.html?object=47269)

#### list_of_scenarios
- Process Internal Upsell Campaign (views/view_55064.html)
- Execute Interactive Retention Campaign (views/view_55098.html)
- Execute Internal Campaign (views/view_55350.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerCampaignExecution/12.0.0
