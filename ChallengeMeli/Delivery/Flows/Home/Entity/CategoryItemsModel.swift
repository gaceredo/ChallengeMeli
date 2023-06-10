//
//  CategoryItemsModel.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import Foundation

struct CategoryItemsModel: Decodable {
    let results: [HomeItemModel]
    let paging: PagingItemsModel
}

struct HomeItemModel: Decodable {
    let id: String
    let title: String
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case thumbnail = "thumbnail"
    }
}

struct PagingItemsModel: Decodable {
    let total: Int
    let offset: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case total = "total"
        case offset = "offset"
        case limit = "limit"
    }
}
