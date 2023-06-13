//
//  ReusableCell.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import Foundation

protocol ReusableCell {
    static var reuseIdentifier: String { get }
    static var xibName: String { get }
}

extension ReusableCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var xibName: String {
        return String(describing: self).components(separatedBy: ".").last ?? ""
    }
}
