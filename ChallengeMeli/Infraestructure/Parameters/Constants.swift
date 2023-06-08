//
//  Constants.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import Foundation

enum Path {
    static var baseImage: String {
        switch AppEnvironment.current {
        case .Debug,
             .Release:  return ""
        }
    }
}
