//
//  HomeItemCollectionViewCell.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import UIKit
import Kingfisher

class HomeItemCollectionViewCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: HomeItemModel) {
        self.itemTitle.text = data.title
        if let url = URL(string: data.thumbnail ?? "") {
            let resource = ImageResource(downloadURL: url, cacheKey: data.thumbnail)
            self.itemImage.kf.setImage(with: resource)
        } else {
            self.itemImage.image = UIImage(systemName: "photo.on.rectangle.angled")
        }
    }
    
}
