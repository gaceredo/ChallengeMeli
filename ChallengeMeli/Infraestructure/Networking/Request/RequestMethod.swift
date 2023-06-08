//
//  RequestMethod.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import Foundation

enum RequestMethod: String {
    case POST = "POST"
    case DELETE = "DELETE"
    case GET = "GET"
    case PUT = "PUT"
    
    var value: String {
        return rawValue
    }
}
