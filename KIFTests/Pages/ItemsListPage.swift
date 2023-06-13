//
//  ItemsListPage.swift
//  KIFTests
//
//  Created by Gustavo Aceredo on 13/6/23.
//

import Foundation

enum ItemsListElement: String {
    case collectionView = "collectionView"
    case searchButton = "search"
}

struct ItemsListPage {
    let test: BaseUITest
       
    init(test: BaseUITest) {
         self.test = test
    }
    func waitElementVisible() -> ItemsListPage {
        test.waitforTimeInterval()
        return ItemsListPage(test: test)
    }
    
    func swipeCollectionView() -> ItemsListPage {
        test.swipeTableView(identifier: ItemsListElement.collectionView.rawValue)
        return ItemsListPage(test: test)
    }
    
    func tapSearch() -> ItemsListPage {
        test.tapButton(buttonName: ItemsListElement.searchButton.rawValue)
        return ItemsListPage(test: test)
    }
    
    
    func showDetails() -> DetailsItemPage {
        test.tapRow(identifier: ItemsListElement.collectionView.rawValue)
        return DetailsItemPage(test: test)
    }
    
}
