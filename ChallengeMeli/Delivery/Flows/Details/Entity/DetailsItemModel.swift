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
    let currency_id: String
    let thumbnail: String
    let pictures: [DetailsItemPicturesModel]
    let attributes: [DetailsItemAttributesModel]
}

struct DetailsItemPicturesModel: Decodable {
    let id: String
    let url: String
}

struct DetailsItemAttributesModel: Decodable {
    let id: String
    let name: String
    let value_name: String
}
