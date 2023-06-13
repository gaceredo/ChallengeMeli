# ChallengeMeli

## Description

This repository contains the Meli API solution implemented for the Mercado Libre iOS Challenge

### Navigation flow

The app has the following navigation flow:
- product list
- product details 
- product search

### Specification of the API

#### Product List
URL:  https://api.mercadolibre.com/sites/\(siteId)/search
  Parameters:
  - siteId
  - categoryID
  - offset
  
#### Product Details
  URL:  https://api.mercadolibre.com/items/\(id)

  Parameters:
  - productId
  
#### Product Details Description
  URL:  https://api.mercadolibre.com/items/\(id)/description

  Parameters:
  - productId


#### Product search
  URL:  https://api.mercadolibre.com/sites/\(siteId)/search
  
    Parameters:
  - q


## Requirements
- Xcode 13.0
- Cocoapods
- Minimum iOS Target 14.0

## Implementation

### Architecture

The software design was based in Interaction Driven Design (IDD). This approuch helps focus on modelling behaviour according to the external usage of the system. 
The project has three folders that describes the layers of the architecture.
Delivery, Domain (Core in the project) and Infraestructure. The Delivery layer was implemented using VIPER.

### ChallengeMeli
This is the main application. 
The project has the following dependencies
- Kingfisher
- MBProgressHUD
- SwiftyJSON


### Screens

#### Product List
<p align="center">
  <img src="https://i.ibb.co/sFBpcPq/list.png" width="250" title="hover text">
</p>

#### Product Details
<p align="center">
  <img src="https://i.ibb.co/w7Gb3Yz/deatils.png" width="250">
</p>

#### Product search
<p align="center">
    <img src="https://i.ibb.co/0Jhkg9Q/search.png" width="250" title="hover text">
</p>
