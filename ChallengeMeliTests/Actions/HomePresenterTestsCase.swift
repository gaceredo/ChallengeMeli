//
//  HomePresenterTests.swift
//  ChallengeMeliTests
//
//  Created by Gustavo Aceredo on 13/6/23.
//

import XCTest

class HomePresenterTests: XCTestCase {
    
    var presenter: HomePresenter!
    var mockInteractor: MockHomeInteractor!
    
    override func setUp() {
        super.setUp()
        mockInteractor = MockHomeInteractor()
        presenter = HomePresenter(interactor: mockInteractor, siteId: "", categoryId: "")
    }
    
    override func tearDown() {
        presenter = nil
        mockInteractor = nil
        super.tearDown()
    }
    
    func testListedItems_Success() {
        // Given
        let expectation = XCTestExpectation(description: "listedItems completion should be called with true")
        
        // When
        presenter.listedItems { success in
            // Then
            XCTAssertTrue(success)
            expectation.fulfill()
        }
    
        // Simulate success response from the mock interactor
        mockInteractor.listedItemsCompletion?(.success((CreateObjectList.mockItems)))
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testListedItems_Failure() {
        // Given
        let expectation = XCTestExpectation(description: "listedItems completion should be called with false")
        
        // When
        presenter.listedItems { success in
            // Then
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        
        // Simulate failure response from the mock interactor
        mockInteractor.listedItemsCompletion?(.failure(RequestError.default))
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSearchItems_Success() {
        // Given
        let expectation = XCTestExpectation(description: "searchItems completion should be called with true")
        
        // When
        presenter.searchItems(text: "") { success in
            // Then
            XCTAssertTrue(success)
            expectation.fulfill()
        }
        
        // Simulate success response from the mock interactor
        mockInteractor.searchItemsCompletion?(.success((CreateObjectList.mockItems)))
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSearchItems_Failure() {
        // Given
        let expectation = XCTestExpectation(description: "searchItems completion should be called with false")
        
        // When
        presenter.searchItems(text: "") { success in
            // Then
            
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        
        // Simulate failure response from the mock interactor
        mockInteractor.searchItemsCompletion?(.failure(RequestError.default))
        
        wait(for: [expectation], timeout: 1.0)
    }
}

// MARK: - Mock HomeInteractor

class MockHomeInteractor: HomeInteractorProtocol {
    
    var listedItemsCompletion: ((Result<CategoryItemsModel, RequestError>) -> Void)?
    var searchItemsCompletion: ((Result<CategoryItemsModel, RequestError>) -> Void)?
    
    func listedItems(siteId: String,
                     query: [URLQueryItem],
                     completion: @escaping (Result<CategoryItemsModel, RequestError>) -> Void) {
        listedItemsCompletion = completion
    }
    
    func searchItems(siteId: String,
                     query: [URLQueryItem],
                     completion: @escaping (Result<CategoryItemsModel, RequestError>) -> Void) {
        searchItemsCompletion = completion
    }
}

