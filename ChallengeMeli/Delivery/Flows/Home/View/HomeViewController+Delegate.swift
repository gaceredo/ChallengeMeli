//
//  HomeViewController+Delegate.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.isActiveSearch ? presenter.filterElements.count : presenter.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeItemCollectionViewCell = collectionView.dequeueReusableaCell(forIndexPath: indexPath)
        let item = presenter.isActiveSearch ? presenter.filterElements[indexPath.row] : presenter.elements[indexPath.row]
        cell.configure(data: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 20, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item =  presenter.isActiveSearch ? presenter.filterElements[indexPath.row] : presenter.elements[indexPath.row]
        let controller = DetailsWireFrame.makeDetailsView(id: item.id)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (indexPath.row == presenter.filterElements.count - 1 && !presenter.isLoding && presenter.isActiveSearch) {
            searchItems(text: searchBar.text ?? "")
        }
        
        if (indexPath.row == presenter.elements.count - 1 && !presenter.isLoding) {
            listedItems()
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        configureSearchBarButton()
        presenter.isActiveSearch = false
        presenter.clearValues()
        collectionView.reloadData()
        listedItems()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        searchItems(text: text)
    }
}
