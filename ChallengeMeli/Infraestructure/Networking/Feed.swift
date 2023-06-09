//
//  Feed.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

enum Feed {
    case listedItems(siteId: String)
    case detailsItem(id: String)
    case detailsDescriptionItem(id: String)
}

extension Feed: Endpoint {
    
    var httpMethod: RequestMethod {
        switch self {
        case .listedItems, .detailsDescriptionItem, .detailsItem:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .listedItems(let siteId):
            return "/sites/\(siteId)/search"
        case .detailsDescriptionItem(let id):
            return "/items/\(id)/description"
        case .detailsItem(let id):
            return "/items/\(id)"
        }
    }
}
