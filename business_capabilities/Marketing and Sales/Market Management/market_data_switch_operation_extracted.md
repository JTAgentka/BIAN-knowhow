# Market Data Switch Operation

## Role Definition
This facility handles the real-time operation of the market information dissemination switch that is typically used to support trading and investment functions. It references the access entitlement to services for users maintained by the Market Data Switch Administration service domain (there can be complex rules governing access to various feeds). The dissemination mechanism/switch may support composite pages of data and interactive service requests. It may also support internally published information such as bank rates defined by the bank's treasury unit

## Folder Name
Market Management

## Core Business Object
Market Information Switch Session (object_25.html?object=30354)

## Example of Use
A bank trader request access to a market data feed at their dealing position during a trading session

## Executive Summary
This service domain operates the internal information distribution facility/switch in compliance with administered external subscription information feed service access rights. Note the content is retrieved by the Market Feed Operation service domain from the various external feed services. Internal information can also be published over the switch from various bank sources (such as bank rates provided by treasury).

## Key Features
- Handle access to the information provider (IP) service content
- Store and forward (IP) content over the internal switch
- Handle internal access to the IP content based on user access rights/requests
- Publish internal content over the data switch

## API BIAN Portal Link
Market Data Switch Operation API (https://app.swaggerhub.com/apis/BIAN-3/MarketDataSwitchOperation/12.0.0)

## Served By
None listed

## Serves
- Market Management (object_6.html?object=63703)

## Triggered By
- Payment Initiation (object_20.html?object=29967)
- Customer Relationship Management (object_21.html?object=30437)
- Corporate Current Account (object_21.html?object=34221)
- Payment Order (object_21.html?object=35550)
- Card Clearing (object_21.html?object=36804)
- Letter of Credit (object_21.html?object=38418)
- Bank Guarantee (object_22.html?object=44405)

## Triggers
None listed

## List of Scenarios
- Handle Request for Windfall Investment (views/view_55037.html)
- Handle Request for Corporate Loan (views/view_55212.html)
- Handle Request for Outgoing FCY Credit Transfer via SWIFT (views/view_55095.html)
- Initiate Bank Guarantee (views/view_55496.html)
- Handle Request for Bank Guarantee (views/view_55341.html)
- Process Card Clearing by Card Network (views/view_55080.html)
- Update Letter of Credit for Extension of Validity (views/view_55579.html)
- Handle Request to Extend Validity of Letter of Credit (views/view_55634.html)
- Handle Request to Issue Letter of Credit (views/view_55618.html)
- Initiate Letter of Credit (views/view_54819.html)
- Handle Incoming FCY Credit Transfer for LCY Account (views/view_54977.html)

## Individual Analytics
- informationFeedSwitchOperatingSessionAccumulators
- informationFeedSwitchOperatingSessionActivityAnalysis
- informationFeedSwitchOperatingSessionPerformanceAnalysis
- informationFeedSwitchOperatingSessionTrends&Events

## Portfolio Analytics
- informationFeedSwitchOperatingSessionPortfolioActivityAnalysis
- informationFeedSwitchOperatingSessionPortfolioMake-UpAnalysis
- informationFeedSwitchOperatingSessionPortfolioPerformanceAnalysis

## Service Role
Operate the day to day information distribution facility in compliance with administered access rights and the demand and availability of subscribed information feed services. Note content is provided by the Market Feed Operation service domain for external feeds. Internal information can also be published over the channel from various content sources.

## Registration Status
Registered