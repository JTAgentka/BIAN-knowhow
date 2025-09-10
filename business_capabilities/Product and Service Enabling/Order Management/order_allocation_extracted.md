# Order Allocation - BIAN Capability

## Overview
**Capability Name:** Order Allocation  
**Folder:** Order Management  
**Core Business Object:** SecuritiesAllocationTransaction

## Role Definition
Apply appropriate rules to allocate a completed or partially completed block order across the customers placing the constituent market orders

## Example of Use
A large market order is partly fulfilled and the pricing and allocation of the trade is allocated across the counterparties

## Executive Summary
This Service Domain allocates partially fulfilled market trades

## Key Features
- Review allocation rules for partially completed market orders
- Allocate traded securities in accordance with allocation rules
- Provide allocation details as requested

## API Details
**BIAN Portal Link:** [https://app.swaggerhub.com/apis/BIAN-3/OrderAllocation/12.0.0](https://app.swaggerhub.com/apis/BIAN-3/OrderAllocation/12.0.0)

## Service Relationships

### Served By
- Wave 6
- Clearing And Settlement

### Serves
- Order Management

### Triggered By
- Market Operations

### Triggers
- Securities Allocation Transaction_Reporting
- Securities Allocation Transaction_Invocation
- Securities Allocation Transaction_Instantiation
- Order Allocation_SD_Service Group
- Securities Allocation Procedure
- Apply Order Allocation Rules Workstep
- Update (Partially Completed) Market Order Workstep

## Scenarios
| Scenario Name | Link |
|---------------|------|
| BIAN Service Landscape V12.0 Value Chain | views/view_51705.html |
| BIAN Service Landscape V12.0 Matrix View | views/view_51891.html |
| Order Allocation SD Overview | views/view_52059.html |