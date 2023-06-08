//
//  Feed.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

enum Feed {
    case listedItems(siteId: String)
}

extension Feed: Endpoint {
    
    var httpMethod: RequestMethod {
        switch self {
        case .listedItems:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .listedItems(let siteId):
            return "/sites/\(siteId)/search"
        }
    }
}
