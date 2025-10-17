
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


### Lead Management

#### role_definition
This service domain captures, evaluates and progresses identified lead/opportunities that may arise during customer relationship development, sales, servicing and fulfillment interactions. It will clarify and confirm the customer's interest and check that the product is suitable and the customer eligible prior to initiating the formal offer process (see service domain Customer Offer)

#### core_business_object
SalesLeadManagement

#### key_features
- Lead/opportunity classification and capture
- Lead/opportunity evaluation and confirmation
- Verify opportunity, initiate/schedule customer offer processing

#### example_of_use
A lead is identified during a customer servicing interaction and the lead captured for subsequent follow-up

#### triggered_by
- Customer Relationship Management (object_21.html?object=30437)
- Party Routing Profile (object_21.html?object=31558)
- Customer Offer (object_22.html?object=39968)
- Customer Campaign Execution (object_22.html?object=40236)
- Point of Service (object_22.html?object=43170)
- Consumer Advisory Services (object_22.html?object=44522)
- Session Dialogue (object_23.html?object=48273)

#### triggers
- Party Routing Profile (object_21.html?object=31558)
- Customer Offer (object_22.html?object=39968)

#### list_of_scenarios
- Perform Customer Eligibility Profile Update
- Process Internal Upsell Campaign
- Retrieved ASPSP Account Information Trigger NBP
- Execute Interactive Retention Campaign
- Handle Request for Product Support
- Develop Opportunity
- Process Internal Customer Upgrade
- Execute Internal Campaign
- Conduct Relationship Development Planning
- Customer Sees the NBP Offer and Decides if to Apply
- Perform Customer Relationship Development Planning
- Handle Request for Consumer Loan Checks and Options
- Initiate, assign development of a lead/opportunity
- Initiate lead/opportunity procedure (capture the lead details)
- Retrieve details about lead/opportunity development
- Retrieve details about a lead/opportunity
- Accept, reject etc a lead/opportunity procedure
- Request manual intervention in development (e.g. prospect contact)
- Execute automated action against a lead opportunity development task (e.g. generate message)
- Update details about a lead/opportunity
- Update details about lean/opportunity development task
- Control the processing of a lead/opportunity (e.g. raise priority)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN3/LeadandOpportunityManagement/12.0.0

