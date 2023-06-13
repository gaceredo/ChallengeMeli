//
//  HomeInteractorTestsCase.swift
//  ChallengeMeliTests
//
//  Created by Gustavo Aceredo on 13/6/23.
//

import XCTest
import Combine

@testable import ChallengeMeli

class MockHomeDependencies: HomeInteractorDependenciesProtocol {
    
    var listedItemsReturnValue: Result<CategoryItemsModel, RequestError>!
    var searchItemsReturnValue: Result<CategoryItemsModel, RequestError>!
    
    func listedItems(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<CategoryItemsModel, RequestError> {
        return Result.Publisher(listedItemsReturnValue).eraseToAnyPublisher()
    }
    
    func searchItems(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<CategoryItemsModel, RequestError> {
        return Result.Publisher(searchItemsReturnValue).eraseToAnyPublisher()
    }
}

class HomeInteractorTestsCase: XCTestCase {
    
    var sut: HomeInteractor!
    var dependencies: MockHomeDependencies!
    
    override func setUp() {
        super.setUp()
        dependencies = MockHomeDependencies()
        sut = HomeInteractor(dependencies: dependencies)
    }
    
    override func tearDown() {
        sut = nil
        dependencies = nil
        super.tearDown()
    }
    
    func testListedItems() {

        // Given
        let expectedSiteId = "123"
        let expectedQuery: [URLQueryItem] = []
        
        let expectedResult: Result<CategoryItemsModel, RequestError> = .success(CreateObjectList.mockItems)
        dependencies.listedItemsReturnValue = expectedResult
        
        var completionResult: Result<CategoryItemsModel, RequestError>?
        // When
        sut.listedItems(siteId: expectedSiteId, query: expectedQuery) { result in
            completionResult = result
        }
        
        // Then
        XCTAssertNotNil(dependencies.listedItemsReturnValue)
        
        if case let .success(success) = dependencies.listedItemsReturnValue {
            XCTAssertEqual(success.results[0].id, CreateObjectList.mockItems.results[0].id)
        } else {
            XCTFail("an unexpected error occurred")
        }
    }
    
    func testListedItemsError() {
        // Given
        let expectedSiteId = "123"
        let expectedQuery: [URLQueryItem] = []
        
        let expectedResult: Result<CategoryItemsModel, RequestError> = .failure(RequestError.default)
        dependencies.listedItemsReturnValue = expectedResult
        
        var completionResult: Result<CategoryItemsModel, RequestError>?
        // When
        sut.listedItems(siteId: expectedSiteId, query: expectedQuery) { result in
            completionResult = result
        }
        // Then
        XCTAssertNotNil(dependencies.listedItemsReturnValue)
        if case let .failure(error) = dependencies.listedItemsReturnValue {
            XCTAssertEqual(error.message, "Ocurrio un error inesperado")
        } else {
            XCTFail("Expected unsuccessful response, but received success")
        }
    }
    
}
