//
//  Error+extension.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import Foundation

extension Error {
    var errorCode:Int? {
        return (self as NSError).code
    }
}
