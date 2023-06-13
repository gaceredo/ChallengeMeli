//
//  HomeInteractorDependenciesTestsCase.swift
//  ChallengeMeliTests
//
//  Created by Gustavo Aceredo on 12/6/23.
//

import XCTest
import Combine

class HomeInteractorTests: XCTestCase {
    
    var sut: HomeInteractor!
    var dependencies: MockHomeInteractorDependencies!
    
    override func setUp() {
        super.setUp()
        dependencies = MockHomeInteractorDependencies()
        sut = HomeInteractor(dependencies: dependencies)
    }
    
    override func tearDown() {
        sut = nil
        dependencies = nil
        super.tearDown()
    }
    
    func testListedItemsSucces() {
        // Given
        let expectedQuery: [URLQueryItem] = []
        let expectedFeedKind: Feed = .listedItems(siteId: "MLU")
        
        let expectedResult: CategoryItemsModel = CreateObjectList.mockItems
        // When
        dependencies.listedItemsReturnValue = Result.Publisher(expectedResult).eraseToAnyPublisher()
        
        let _ = dependencies.listedItems(query: expectedQuery, expectedFeedKind)
        // Then
        XCTAssertTrue(dependencies.listedItemsCalled)
        XCTAssertEqual(dependencies.listedItemsQuery, expectedQuery)
    }
    
    func testSearchItemsSuccess() {
        // Given
        let expectedQuery: [URLQueryItem] = []
        let expectedFeedKind: Feed = .listedItems(siteId: "MLU")
        
        let expectedResult: CategoryItemsModel = CreateObjectList.mockItems
        // When
        dependencies.searchItemsReturnValue = Result.Publisher(expectedResult).eraseToAnyPublisher()
        
        let _ = dependencies.searchItems(query: expectedQuery, expectedFeedKind)
        // Then
        XCTAssertTrue(dependencies.searchItemsCalled)
        XCTAssertEqual(dependencies.searchItemsQuery, expectedQuery)
    }
}
