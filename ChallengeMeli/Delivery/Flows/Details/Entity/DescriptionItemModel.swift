//
//  DescriptionItemModel.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 9/6/23.
//

import Foundation

struct DescriptionItemModel: Decodable {
    let plainText: String
    
    enum CodingKeys: String, CodingKey {
        case plainText = "plain_text"
    }
    
}
