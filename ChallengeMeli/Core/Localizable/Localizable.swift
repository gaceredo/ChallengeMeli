//
//  Localizable.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import Foundation

enum Localizable {
    
    enum HomeView: String, LocalizableString {
        var screen: String { "HomeView" }
        case title
        case offset
        case category
        case emptyResult
        case alertTitle
        case alertButton
        case collectionView
    }
    
    enum DetailsView: String, LocalizableString {
        var screen: String {"DetailsView"}
        case q
    }
    
}
