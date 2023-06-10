//
//  AttributesItemTableViewCell.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 10/6/23.
//

import UIKit

class AttributesItemTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: DetailsItemModel?) {
        data?.attributes.forEach {
            let name = UILabel()
            name.text = $0.name
            name.font = .systemFont(ofSize: 17.0)
            name.numberOfLines = 0
            let valueName = UILabel()
            valueName.font = .boldSystemFont(ofSize: 17.0)
            valueName.numberOfLines = 0
            valueName.text = $0.valueName
            let cell = UIStackView(arrangedSubviews: [name, valueName])
            cell.axis = .vertical
            cell.alignment = .fill
            stackView.addArrangedSubview(cell)
        }
    }
    
}
