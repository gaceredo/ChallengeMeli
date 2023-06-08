//
//  ConfigurableCell.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import Foundation

public protocol ConfigurableCell: ReusableCell {
    associatedtype DataType
    func configure(data: DataType)
}
