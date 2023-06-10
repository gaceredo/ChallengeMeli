//
//  CarouselCell.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 9/6/23.
//

import UIKit
import Kingfisher

class CarouselCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet private weak var imageView: UIImageView!
    
    func configure(data: String) {
        let url = URL(string: data)
        imageView.kf.setImage(with: url)
    }
}
