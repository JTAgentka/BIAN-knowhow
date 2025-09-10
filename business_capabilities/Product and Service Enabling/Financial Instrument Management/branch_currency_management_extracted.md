# Branch Currency Management - BIAN Capability Extraction

| Field | Value |
|-------|-------|
| **Capability Name** | Branch Currency Management |
| **Role Definition** | This service domain is responsible for tracking the available cash (currency) inventory held and distributed within the Branch location to teller and ATM positions, to ensure adequate float is always available at all positions. Also to check balances and see that excess cash is transferred to secure central storage as appropriate. If necessary specific criteria can be selected to refine the allocation |
| **Folder Name** | Financial Instrument Management |
| **Core Business Object** | Branch Currency Management (object_38.html?object=48818) |
| **Example of Use** | The branch management reviews the available float and confirms end of day balances at the teller positions |
| **Executive Summary** | Track cash inventory, project demand and ensure all cash is accounted for within the branch |
| **Key Features** | - Cash inventory usage and availability tracking<br>- Branch cash inventory requirements evaluation and planning<br>- Oversight of cash availability and movements within the branch |
| **API BIAN Portal Link** | https://app.swaggerhub.com/apis/BIAN-3/BranchCurrencyManagement/12.0.0 |
| **Served By** | Not specified |
| **Serves** | - Financial Instrument Management<br>- Financial Instrument Custodial Management<br>- Financial Instrument Inventory Management |
| **Triggered By** | - ATM Network Management |
| **Triggers** | Not specified |
| **List of Scenarios** | - Review ATM Float and Outage (views/view_54837.html) |

## Additional Information

- **BIAN Life Cycle Registration Status**: Registered
- **Service Role**: Manage the secure movement of cash and currencies between branches/ATMs and central holdings.
- **Individual Analytics**: branchCashAllocationAccumulators, branchCashAllocationActivityAnalysis, branchCashAllocationPerformanceAnalysis, branchCashAllocationTrends&Events
- **Portfolio Analytics**: branchCashAllocationPortfolioActivityAnalysis, branchCashAllocationPortfolioMake-UpAnalysis, branchCashAllocationPortfolioPerformanceAnalysis