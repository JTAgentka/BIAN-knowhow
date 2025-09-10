# Card Terminal Administration

## Capability Name
Card Terminal Administration

## Role Definition
This service domain is responsible for the allocation of the Point of Sale Terminal of Authorization Link interface to the Merchant, configuring and activating the device or interface, and managing its ongoing status, including replacement of faulty devices or interfaces. The Acquiring Bank configures the terminal or the interface to meet the specific requirements of the Merchant depending on the merchant type, risk and other terms and conditions.

## Folder Name
Issued Device Management

## Core Business Object
Card POS Device Allocation (object_26.html?object=44298)

## Example of Use
A Merchant is assigned one or more devices or interfaces for processing Card Charge authorization and submission when an Acquiring Bank sets up a new Merchant Account. (Note this can involve a Point of Sale Terminal or an Authorization Link interface to the merchant's own cash register system).

## Executive Summary
This service domain administers the POS Network including the inventory, terminal characteristics, deployment and status of the POS devices.

## Key Features
- POS inventory administration
- Merchant POS/Interface registration/configuration
- Merchant POS/Interface status maintenance

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CardTerminalAdministration/12.0.0

## Served By
- Card Terminal Operation (object_22.html?object=45274)

## Serves
- Issued Device Management (object_6.html?object=57833)

## Triggered By
- Card Terminal Operation (object_22.html?object=45274)

## Triggers
- Not explicitly specified

## List of Scenarios
1. Authorise Card Use by Acquirer (views/view_55588.html)