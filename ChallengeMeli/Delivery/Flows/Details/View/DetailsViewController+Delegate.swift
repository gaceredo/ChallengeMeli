//
//  DetailsViewController+Delegate.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 10/6/23.
//

import UIKit

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = presenter.cells[indexPath.row]
        
        switch index {
        case .carrusel :
            let cell: CarruselImagesTableViewCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            cell.configure(data: presenter.item)
            return cell
        case .description:
            let cell: DescriptionItemTableViewCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            cell.configure(data: presenter.descriptionItem)
            return cell
        case .price:
            let cell: PriceItemTableViewCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            cell.configure(data: presenter.item)
            return cell
        case .attributes:
            let cell: AttributesItemTableViewCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
            cell.configure(data: presenter.item)
            return cell
        }
    }
}

