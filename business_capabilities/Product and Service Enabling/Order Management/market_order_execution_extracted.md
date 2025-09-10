# Market Order Execution - BIAN Capability Extraction

| Field | Value |
|-------|-------|
| **Capability Name** | Market Order Execution |
| **Role Definition** | The Market Order Execution Service Domain is responsible for the booking of securities transactions (e.g. resulting from market orders or some types of corporate actions) on investment accounts, so in terms of security name plus quantity. Market Order Execution knows the different transaction types and the related booking sets. It will call Securities Position Keeping to create the debit and the credit bookings of a transaction. It will ensure that the bookings of a securities transaction are executed completely or not at all (the latter in the case of an exception). The execution of a market order may be in parts (trades) or it may be combined with other market orders for a block trade. The Service Connection "Execute Market Order" on this Service Domain handles the execution of (an undivided part of) one Market Order. A securities transaction will have a related money transaction. This will be handled by Payment Order - Payment Execution. |
| **Folder Name** | Order Management |
| **Core Business Object** | Market Trade Transaction (object_25.html?object=29545) |
| **Example of Use** | A customer decides to sell shares from his or her investment account. The customer issues a sell order and a Market Order is created with the status pending. Market Order will instruct Securities Position Keeping to put a block on the seller's investment account for the amount of shares in the order. Once the bank is informed on successful execution, the status is changed to executed and the Service Connection "Execute Securities Transaction" on Market Order Execution is invoked. Market Order Execution will in turn call Securities Position Keeping to realise the sale in numbers of shares on the involved accounts and remove the block from the seller's investment account. |
| **Executive Summary** | The Market Order Execution Service Domain is responsible for the booking of securities transactions (e.g. resulting from market orders or some types of corporate actions) on investment accounts, so in terms of security name plus quantity. |
| **Key Features** | - Maintain Booking Sets<br>- Record the execution of a sell or a buy order<br>- Ensure recording of all related bookings on Securities Position Keeping |
| **API BIAN Portal Link** | https://app.swaggerhub.com/apis/BIAN-3/MarketOrderExecution/12.0.0 |
| **Served By** | Not specified |
| **Serves** | - Order Management<br>- Order Placement |
| **Triggered By** | Not specified |
| **Triggers** | Not specified |
| **List of Scenarios** | - Market Order Execution SD Overview (views/view_51609.html)<br>- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)<br>- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html) |

## Additional Information

- **BIAN Life Cycle Registration Status**: Registered
- **Service Role**: Orchestrate the completion of market orders from the trading perspective
- **Individual Analytics**: marketOrderTransactionAccumulators, marketOrderTransactionActivityAnalysis, marketOrderTransactionPerformanceAnalysis, marketOrderTransactionTrends&Events
- **Portfolio Analytics**: marketOrderTransactionPortfolioActivityAnalysis, marketOrderTransactionPortfolioMake-UpAnalysis, marketOrderTransactionPortfolioPerformanceAnalysis