# Program Trading - BIAN Capability

## Overview
**Capability Name:** Program Trading  
**Folder:** Order Management  
**Core Business Object:** ProgramTradingOperatingSession

## Role Definition
Program trading covers a broad range of market trading activities, where the trading rules policies driving the trading decisions are automated, likely with some level of human monitoring/oversight as appropriate. This generic Service Domain is intended to support any form of program trading. In practice a bank may find it necessary to 'clone and specialize' the service domain to support different type of program trading it may employ as necessary.

## Example of Use
A bank operates a program trading facility to rebalance some of its managed customer investment portfolios

## Executive Summary
This Service Domain supports a program trading capability where the trading decisions are made based on predefined/programmed rules and policies. Manual oversight and monitoring capabilities are supported as appropriate

## Key Features
- Support the set-up and maintenance of a portfolio of traded securities
- Support the definition and update of automated trading rules and policies
- Support the capture and tracking of market information to trigger trading
- Support manual oversight and monitoring of automated trading activity
- Support the automated execution of market trades

## API Details
**BIAN Portal Link:** [https://app.swaggerhub.com/apis/BIAN-3/ProgramTrading/12.0.0](https://app.swaggerhub.com/apis/BIAN-3/ProgramTrading/12.0.0)

## Service Relationships

### Served By
- Wave 6
- Market Trading

### Serves
- Order Management

### Triggered By
- Wholesale Trading

### Triggers
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

## Scenarios
| Scenario Name | Link |
|---------------|------|
| Program Trading SD Overview | views/view_50743.html |
| BIAN Service Landscape V12.0 Value Chain | views/view_51705.html |
| BIAN Service Landscape V12.0 Matrix View | views/view_51891.html |