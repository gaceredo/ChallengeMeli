//
//  DetailsItemModel.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 9/6/23.
//

import Foundation

struct DetailsItemModel: Decodable {
    let id: String
    let title: String
    let permalink: String
    let condition: String
    let price: Int
    let currencyId: String
    let thumbnail: String
    let pictures: [DetailsItemPicturesModel]
    let attributes: [DetailsItemAttributesModel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case permalink
        case condition
        case price
        case currencyId = "currency_id"
        case thumbnail
        case pictures
        case attributes
    }
}

struct DetailsItemPicturesModel: Decodable {
    let id: String
    let url: String
}

struct DetailsItemAttributesModel: Decodable {
    let id: String
    let name: String
    let valueName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueName = "value_name"
    }
}
