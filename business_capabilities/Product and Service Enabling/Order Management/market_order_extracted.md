# Market Order - BIAN Capability Extraction

| Field | Value |
|-------|-------|
| **Capability Name** | Market Order |
| **Role Definition** | Market Order records an instruction from a customer or his or her representative (which could be an account manager in the bank) to buy or sell securities. It follows the order during its lifetime and reports back to the requestor on the execution. In case of a sell order it puts a block on the investment account when the order is placed. This block will be removed when the order is executed or when it expires. A market order may be broken into multiple market trades or combined with other market orders for a block trade at the bank's discretion |
| **Folder Name** | Order Management |
| **Core Business Object** | Market Trade (object_26.html?object=43608) |
| **Example of Use** | A customer decides to sell shares from his or her investment account. The customer issues a sell order and a market order is created with the status pending. A block is put on the seller's investment account for the amount of shares in the order. Market Order places the order and waits for a confirmation of execution. |
| **Executive Summary** | Market Order records an instruction from a customer or his or her representative to buy or sell securities. It follows the order during its lifetime and reports back to the requestor on the execution. |
| **Key Features** | - Record and manage customer order<br>- Place order and monitor execution<br>- Initiate financial settlement upon order execution |
| **API BIAN Portal Link** | https://app.swaggerhub.com/apis/BIAN-3/MarketOrder/12.0.0 |
| **Served By** | Not specified |
| **Serves** | - Order Management |
| **Triggered By** | Not specified |
| **Triggers** | Not specified |
| **List of Scenarios** | - BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)<br>- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)<br>- Market Order SD Overview (views/view_51909.html) |

## Additional Information

- **BIAN Life Cycle Registration Status**: Registered
- **Service Role**: Orchestrate the completion of market orders from the customer perspective
- **Individual Analytics**: marketOrderTransactionAccumulators, marketOrderTransactionActivityAnalysis, marketOrderTransactionPerformanceAnalysis, marketOrderTransactionTrends&Events
- **Portfolio Analytics**: marketOrderTransactionPortfolioActivityAnalysis, marketOrderTransactionPortfolioMake-UpAnalysis, marketOrderTransactionPortfolioPerformanceAnalysis