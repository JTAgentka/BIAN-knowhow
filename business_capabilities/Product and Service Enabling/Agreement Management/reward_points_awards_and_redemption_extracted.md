# Reward Points Awards And Redemption

## Capability Name
Reward Points Awards And Redemption

## Role Definition
This service domain handles the allocation and redemption of rewards points for customer transaction activity. In order to determine the reward point transaction and apply associated costs the service domain will access reward point arrangement agreements with the customers, merchants and related rewards programs. Note that the interactions between reward programs can be quite complex when 3rd party reward programs are integrated with the bank's own reward programs

## Folder Name
Agreement Management

## Core Business Object
Reward Points Transaction

## Example of Use
A customer redeems bank reward points in order to finance a purchase with a bank associated vendor for air travel. The financial transaction engages the service domain in order to determine redemption requirements and associated payment requirements

## Executive Summary
Handle the allocation and redemption of rewards points for customer transaction activity

## Key Features
- Financial transaction evaluation (price to agreements)
- Reward point redemption transaction
- Associated cash payment initiation

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/RewardPointsAwardsAndRedemption/12.0.0

## Served By
- Operational Services

## Serves
- Agreement Management

## Triggered By
(None specified)

## Triggers
(None specified)

## List of Scenarios
- Instantiate a new Redemption
- Accept, verify, etc. aspects of Redemption processing
- Accept, verify, etc. aspects of Award processing
- Update details relating to Award
- Retrieve details about any aspect of Award
- Accept, verify, etc. aspects of Reward Points Transaction processing
- Update details relating to Redemption
- Retrieve details about any aspect of Reward Points Transaction
- Instantiate a new Reward Points Transaction
- Update details relating to Reward Points Transaction
- Request manual intervention or a decision with respect to Reward Points Transaction
- Execute an available automated action for Reward Points Transaction
- Instantiate a new Award
- Retrieve details about any aspect of Redemption