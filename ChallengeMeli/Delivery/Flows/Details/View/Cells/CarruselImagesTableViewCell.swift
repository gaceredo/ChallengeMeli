//
//  CarruselImagesTableViewCell.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 9/6/23.
//

import UIKit
import Kingfisher

class CarruselImagesTableViewCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet private weak var itemTitle: UILabel!
    @IBOutlet private weak var carruselView: UICollectionView!
    
    var imageUrls: [String] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        carruselView.dataSource = self
        carruselView.delegate = self
        carruselView.isPagingEnabled = true
        let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
        carruselView.collectionViewLayout = layout
        carruselView.registerNib(CarouselCell.self)
    }
    
    func configure(data: DetailsItemModel?) {
        guard let data = data else { return }
        itemTitle.text = data.title
        imageUrls = data.pictures.compactMap {$0.url}
        carruselView.reloadData()
    }
}

extension CarruselImagesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CarouselCell = collectionView.dequeueReusableaCell(forIndexPath: indexPath)
        let imageUrl = imageUrls[indexPath.item]
        cell.configure(data: imageUrl)
        return cell
    }
}


extension CarruselImagesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
