//
//  RequestError.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import Foundation

struct RequestError: Decodable, Error {
    let message: String
    static let `default`: RequestError = RequestError(message: "Ocurrio un error inesperado")
    
    var dictionary: [String: Any] {
        return ["message": message]
    }
}
