# Channel Activity Analysis

## Capability Information

**Capability Name:** Channel Activity Analysis
**Folder Name:** Channel Management
**Core Business Object:** Not explicitly mentioned in the document

## Role Definition
Channel activity analysis provides a range of analytical insights into channel use to support access controls, relationship sales and development approaches and to help detect possible fraudulent activity

## Example of Use
A customer attempts to self-serve a product sale but gives up. Later they call the contact center and their recent attempt is used to route the contact to a sales rep who is prompted to continue the product application

## Executive Summary
This service domain tracks and analyzes channel activity to support relationship development, to detect unwanted behavior, possible fraud, and to constrain channel use as necessary (for example tracking usage frequency and cumulative transaction amounts within a period)

## Key Features
- Analyze activity for potential customer fraud
- Analyze activity for potential merchant fraud
- Analyze activity for relationship development
- Detect device errors and 'bot' access attempts

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/ChannelActivityAnalysis/12.0.0

## Relationships

### Served By
- Advanced Voice Services Management (object_20.html?object=29564)
- Channel Activity Analysis (object_21.html?object=34254)
- eBranch Management (object_21.html?object=34844)
- Customer Behavior Insights (object_21.html?object=34917)
- Advanced Voice Services Operations (object_21.html?object=37680)
- Contact Center Management (object_22.html?object=40392)
- Party Authentication (object_22.html?object=40912)
- Contact Routing (object_22.html?object=41059)
- Contact Handler (object_20.html?object=41839)
- Transaction Authorization (object_23.html?object=48811)

### Serves
- Channel Management (object_6.html?object=130032)

### Triggered By
- Servicing Order (object_21.html?object=32295)
- Processing Order (object_20.html?object=33179)
- Channel Activity Analysis (object_21.html?object=34254)
- eBranch Management (object_21.html?object=34844)
- Contact Handler (object_20.html?object=41839)

### Triggers
- Channel Activity Analysis (object_21.html?object=34254)
- Channel Activity History (object_21.html?object=38870)
- Customer Behavior Models (object_22.html?object=41791)

## List of Scenarios
- Process Authentication Request by Issuer (views/view_54669.html)
- Flag Bots Acting as Customers or TPPs (views/view_55049.html)
- Handle Request for Token Assurance (views/view_54761.html)
- Review Use of Products and Services Via eBranch (views/view_54778.html)