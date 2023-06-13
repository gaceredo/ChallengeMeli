//
//  KIFTests.swift
//  KIFTests
//
//  Created by Gustavo Aceredo on 13/6/23.
//

import XCTest
import KIF

final class KIFTests: BaseUITest {

    func testShowDetails() {
        _ = ItemsListPage(test: self)
            .waitElementVisible()
            .swipeCollectionView()
            .showDetails()
            .waitElementVisible()
            .back()
    }
}
