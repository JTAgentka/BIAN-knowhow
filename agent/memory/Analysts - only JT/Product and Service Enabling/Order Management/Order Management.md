# Order Management

## Service Domains

### Order Allocation

#### role_definition
Apply appropriate rules to allocate a completed or partially completed block order across the customers placing the constituent market orders

#### core_business_object
SecuritiesAllocationTransaction

#### key_features
- Review allocation rules for partially completed market orders
- Allocate traded securities in accordance with allocation rules
- Provide allocation details as requested

#### example_of_use
A large market order is partly fulfilled and the pricing and allocation of the trade is allocated across the counterparties

#### triggered_by
- Market Operations

#### triggers
- Securities Allocation Transaction_Reporting
- Securities Allocation Transaction_Invocation
- Securities Allocation Transaction_Instantiation
- Order Allocation_SD_Service Group
- Securities Allocation Procedure
- Apply Order Allocation Rules Workstep
- Update (Partially Completed) Market Order Workstep

#### list_of_scenarios
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)
- Order Allocation SD Overview (views/view_52059.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/OrderAllocation/12.0.0

---

### Trade Confirmation Matching

#### role_definition
Trade matching and confirmation/affirmation is the process by which the broker dealer and institutional investor involved in a market trade ensure they agree all terms early in the trade process. The matching function is typically performed by a central market facility with both broker dealer and the institutional investor reporting trade details independently. The central system matches reported trades and then seeks confirmation/affirmation from the interested parties. This Service Domain supports the broker or investor role interfacing to that central market service

#### core_business_object
Trade Confirmation Matching (object_37.html?object=42814)

#### key_features
- Report trades to the matching service
- Review matched trade reports and confirm/affirm details
- Resolve and escalate unmatched trade issues

#### example_of_use
Broker dealer and institutional investor trade details are matched and confirmation/affirmation obtained during a trading period

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
- BIAN Service Landscape V12.0 Value Chain Overview (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51789.html)
- Trade Confirmation Matching SD Overview (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/TradeConfirmationMatching/12.0.0

---

### Trading Book Oversight

#### role_definition
The bank's trading book tracks the securities held by the bank that are frequently traded and may implement sophisticated risk measures to manage the banks exposure. Trading book oversight is responsible for tracking and analyzing the bank's trading book to manage risk

#### core_business_object
Trading Book Oversight (object_37.html?object=42959)

#### key_features
- Consolidate and maintain the bank's trading book
- Analyze the trading book's positions and sensitivities
- Detect out of patter trading activity
- Initiate remedial actions when excessive risk/exposure is detected

#### example_of_use
Trading book oversight reviews recent trading activity to confirm activity remains within the banks trading risk tolerance

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
- Trading Book Oversight SD Overview (views/view_51246.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/TradingBookOversight/12.0.0

---

### Quote Management

#### role_definition
Quote management handles the process by which a trader obtains quotes from multiple market makers in order to select the bank to execute a trade with. Recent trade prices reported to the exchange can be compared with trade activity for the different quoting banks in order to make the selection

#### core_business_object
QuotationProcedure

#### key_features
- Review recent market trade prices for the selected security
- Obtain quotes from available market makers in the security
- Review recent trade activity for the market makers as appropriate
- Select preferred market bid offer quote

#### example_of_use
A trader obtains quotes from multiple market makers prior to executing an agency trade for a corporate investor customer

#### triggered_by
- Wholesale Trading

#### triggers
- Quotation Procedure_ Analytics Object
- Quotation
- Quotation Procedure_Reporting
- Quotation Procedure_Instantiation
- Quotation Procedure_Invocation
- Quote Management_SD_Operations
- Market Quote Selection Workstep
- Market Quote Request Workstep
- Process

#### list_of_scenarios
- Quote Management SD Overview (views/view_51387.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/QuoteManagement/12.0.0

---

### Trade and Price Reporting

#### role_definition
Operate a trade reporting facility as required by applicable trading market participation rules and regulations. Capture and transmit executed trade details to the exchange in compliance with the required timeframes and operating schedules

#### core_business_object
Trade and Price Reporting (object_37.html?object=44350)

#### key_features
- Capture market trades executed in the front office
- Check and report trade details to the exchange in a timely manner

#### example_of_use
Real-time trade reporting is processed for market trades executed through specific trading markets accessed by the bank

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
- Trade/Price Reporting SD Overview (views/view_51153.html)
- Trade and Price Reporting SD Overview (views/view_51525.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/TradeandPriceReporting/12.0.0

---

### Program Trading

#### role_definition
Program trading covers a broad range of market trading activities, where the trading rules policies driving the trading decisions are automated, likely with some level of human monitoring/oversight as appropriate. This generic Service Domain is intended to support any form of program trading. In practice a bank may find it necessary to 'clone and specialize' the service domain to support different type of program trading it may employ as necessary.

#### core_business_object
ProgramTradingOperatingSession

#### key_features
- Support the set-up and maintenance of a portfolio of traded securities
- Support the definition and update of automated trading rules and policies
- Support the capture and tracking of market information to trigger trading
- Support manual oversight and monitoring of automated trading activity
- Support the automated execution of market trades

#### example_of_use
A bank operates a program trading facility to rebalance some of its managed customer investment portfolios

#### triggered_by
- Wholesale Trading

#### triggers
- Program Trading Operating Session_ Analytics Object
- Program Trading Operating Session_Reporting
- Program Trading Operating Session_Instantiation
- Program Trading Operating Session_Invocation
- Program Trading_SD_Operations
- Program Trading_SD_Service Group
- Program Traded Portfolio Algorithm Function
- Program Trade Execution Function
- Program Traded Portfolio Maintenance Function
- Operate

#### list_of_scenarios
- Program Trading SD Overview (views/view_50743.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProgramTrading/12.0.0

---

### Securities Fails Processing

#### role_definition
Market trades of securities may fail at different stages in the clearing and settlement processing. This Service Domain handles the resolution of securities processing failures

#### core_business_object
Securities Fails Processing (object_37.html?object=44403)

#### key_features
- Research and determine the reason for securities back office processing failures
- Determine corrective action required
- Agree and execute resolution with interested parties

#### example_of_use
The settlement details for an executed trade are rejected by the counterparty during confirmation. The back office traces the deal activity to identify the source of the clerical error obtain the agreement for the resolution and make the necessary changes to the transaction and trade reporting

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- Securities Fails Processing SD Overview (views/view_51735.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/SecuritiesFailsProcessing/12.0.0

---

### Credit Risk Operations

#### role_definition
This Service Domain monitors the counterparty credit limits (CCL) used to govern trading activity to manage credit exposure. Note there may be regulatory requirements that determine allowed CCLs.

#### core_business_object
TradingCreditPositionMeasurement

#### key_features
- Establish counterparty trading credit limits
- Monitor limits and raise alerts against limit breaches

#### example_of_use
A trading desk checks a proposed trade against trading counterparty credit limits

#### triggered_by
- Wholesale Trading

#### triggers
- Trading Credit Position Measurement_ Analytics Object
- Trading Credit Position
- Trading Credit Position Measurement_Instantiation
- Credit Risk Operations_SD_Operations
- Trading Credit Position Measurement_Reporting
- Trading Credit Position Measurement_Invocation
- Credit Risk Operations_SD_Service Group
- Trading Counterparty Credit Limit Indicator
- Monitor

#### list_of_scenarios
- Credit Risk Operations SD Overview (views/view_51117.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CreditRiskOperations/12.0.0

---

### Consumer Investments

#### role_definition
This supports consumer initiated securities investment and trading activity for their self-managed securities investments. Trades will typically be blocked/netted against the bank's own securities position for subsequent market execution. Quotes/prices are based on the prevailing price at the time of the customer instruction to trade

#### core_business_object
Securities Order (object_26.html?object=43861)

#### key_features
- Provide price quotes
- Initiate market order for consumer customer
- Update banks security position

#### example_of_use
An consumer initiates a securities purchase for their investment portfolio, providing funds from their linked 'trading' current account

#### triggered_by
No triggers specified

#### triggers
- Financial Instrument Valuation
- Market Data Switch Operation
- Current Account
- Customer Billing
- Financial Accounting

#### list_of_scenarios
- Consumer Investments SD Overview (views/view_51693.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ConsumerInvestments/12.0.0

---

### Market Order

#### role_definition
Market Order records an instruction from a customer or his or her representative (which could be an account manager in the bank) to buy or sell securities. It follows the order during its lifetime and reports back to the requestor on the execution. In case of a sell order it puts a block on the investment account when the order is placed. This block will be removed when the order is executed or when it expires. A market order may be broken into multiple market trades or combined with other market orders for a block trade at the bank's discretion

#### core_business_object
Market Trade (object_26.html?object=43608)

#### key_features
- Record and manage customer order
- Place order and monitor execution
- Initiate financial settlement upon order execution

#### example_of_use
A customer decides to sell shares from his or her investment account. The customer issues a sell order and a market order is created with the status pending. A block is put on the seller's investment account for the amount of shares in the order. Market Order places the order and waits for a confirmation of execution.

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)
- Market Order SD Overview (views/view_51909.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/MarketOrder/12.0.0

---

### Market Order Execution

#### role_definition
The Market Order Execution Service Domain is responsible for the booking of securities transactions (e.g. resulting from market orders or some types of corporate actions) on investment accounts, so in terms of security name plus quantity. Market Order Execution knows the different transaction types and the related booking sets. It will call Securities Position Keeping to create the debit and the credit bookings of a transaction. It will ensure that the bookings of a securities transaction are executed completely or not at all (the latter in the case of an exception). The execution of a market order may be in parts (trades) or it may be combined with other market orders for a block trade. The Service Connection "Execute Market Order" on this Service Domain handles the execution of (an undivided part of) one Market Order. A securities transaction will have a related money transaction. This will be handled by Payment Order - Payment Execution.

#### core_business_object
Market Trade Transaction (object_25.html?object=29545)

#### key_features
- Maintain Booking Sets
- Record the execution of a sell or a buy order
- Ensure recording of all related bookings on Securities Position Keeping

#### example_of_use
A customer decides to sell shares from his or her investment account. The customer issues a sell order and a Market Order is created with the status pending. Market Order will instruct Securities Position Keeping to put a block on the seller's investment account for the amount of shares in the order. Once the bank is informed on successful execution, the status is changed to executed and the Service Connection "Execute Securities Transaction" on Market Order Execution is invoked. Market Order Execution will in turn call Securities Position Keeping to realise the sale in numbers of shares on the involved accounts and remove the block from the seller's investment account.

#### triggered_by
No triggers specified

#### triggers
No triggers specified

#### list_of_scenarios
- Market Order Execution SD Overview (views/view_51609.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/MarketOrderExecution/12.0.0

---
