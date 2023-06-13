//
//  BaseUITest.swift
//  KIFTests
//
//  Created by Gustavo Aceredo on 13/6/23.
//

import XCTest

class BaseUITest : XCTestCase {
    
    let indexMock = IndexPath(row: 0, section: 0)
    
    func tapButton(buttonName: String) {
        tester().tapView(withAccessibilityLabel: buttonName)
    }
    
    func waitElementVisible(elementName: String){
        tester().waitForView(withAccessibilityLabel: elementName)
    }
    
    func waitforTimeInterval(){
        tester().wait(forTimeInterval: 2.0)
    }
    
    func swipeTableView(identifier: String,
                        size vertical: CGFloat = UIScreen.main.bounds.height) {
        tester().scrollView(withAccessibilityIdentifier: identifier, byFractionOfSizeHorizontal: 0, vertical: vertical)
    }
    func tapRow(identifier: String) {
        tester().tapItem(at: indexMock,
                         inCollectionViewWithAccessibilityIdentifier: identifier)
    }
    
    func swipeCollectionView(identifier: String,
                             size horizontal: CGFloat = UIScreen.main.bounds.height) {
        tester().scrollView(withAccessibilityIdentifier: identifier, byFractionOfSizeHorizontal: horizontal, vertical: 0)
    }
    func enterText(text: String) {
        tester().enterText(intoCurrentFirstResponder: text)
    }
}
