//
//  DetailsItemPage.swift
//  KIFTests
//
//  Created by Gustavo Aceredo on 13/6/23.
//

import Foundation

enum DetailsItemsListElement: String {
    case back = "Lista de Items"
}

struct DetailsItemPage {

    let test: BaseUITest

    init(test: BaseUITest) {
        self.test = test
    }
    func waitElementVisible() -> DetailsItemPage {
        test.waitforTimeInterval()
        return DetailsItemPage(test: test)
    }
    
    func back() -> DetailsItemPage {
        test.tapButton(buttonName: DetailsItemsListElement.back.rawValue)
        return DetailsItemPage(test: test)
    }
   
}
