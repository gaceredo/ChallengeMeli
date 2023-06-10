//
//  DescriptionItemTableViewCell.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 9/6/23.
//

import UIKit

class DescriptionItemTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet private weak var itemDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: DescriptionItemModel?) {
        itemDescription.text = data?.plainText
    }
    
}
