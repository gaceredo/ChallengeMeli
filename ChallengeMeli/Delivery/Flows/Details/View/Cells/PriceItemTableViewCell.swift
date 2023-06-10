//
//  PriceItemTableViewCell.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 10/6/23.
//

import UIKit

class PriceItemTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet private weak var itemPrice: UILabel!
    
    func configure(data: DetailsItemModel?) {
        guard let price = data?.price,
              let currency = data?.currencyId else {
            return
        }
        itemPrice.text = price.formatted(.currency(code: currency))
    }
}
