# Currency Exchange - BIAN Capability Extraction

| Field | Value |
|-------|-------|
| **Capability Name** | Currency Exchange |
| **Role Definition** | This is an over the counter service where currency is exchanged and the transaction uses preferential rates and can include transaction fees. Note in some cases travelers checks can be handled as a pseudo currency within this capability. Note that Branch and teller currency inventory tracking and distribution is administered by Branch Currency Management and Branch Currency Distribution service domains |
| **Folder Name** | Financial Instrument Management |
| **Core Business Object** | Currency Exchange (object_38.html?object=46442) |
| **Example of Use** | A non-bank customer obtains a currency exchange at the teller, buying foreign currency for local currency in cash |
| **Executive Summary** | Service Domain supports over the counter currency exchange |
| **Key Features** | - FX transaction pricing<br>- FX transaction capture<br>- Document handling |
| **API BIAN Portal Link** | https://app.swaggerhub.com/apis/BIAN-3/CurrencyExchange/12.0.0 |
| **Served By** | Not specified |
| **Serves** | - Financial Instrument Management |
| **Triggered By** | - Business Unit Management<br>- Business Development |
| **Triggers** | - Branch Currency Distribution<br>- Corporate Treasury<br>- Current Account<br>- Financial Accounting |
| **List of Scenarios** | Not specified |

## Additional Information

- **BIAN Life Cycle Registration Status**: Registered
- **Service Role**: This is an over the counter service where currency is exchanged and the transaction uses preferential rates and can include transaction fees. Note in some cases travelers checks can be handled as a pseudo currency within this capability. Note that Branch and teller currency inventory is administered by Branch Currency Management and Branch Currency Distribution service domains
- **Individual Analytics**: currencyExchangeTransactionAccumulators, currencyExchangeTransactionActivityAnalysis, currencyExchangeTransactionPerformanceAnalysis, currencyExchangeTransactionTrends&Events
- **Portfolio Analytics**: currencyExchangeTransactionPortfolioActivityAnalysis, currencyExchangeTransactionPortfolioMake-UpAnalysis, currencyExchangeTransactionPortfolioPerformanceAnalysis