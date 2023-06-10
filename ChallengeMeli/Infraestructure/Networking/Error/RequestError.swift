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
}
