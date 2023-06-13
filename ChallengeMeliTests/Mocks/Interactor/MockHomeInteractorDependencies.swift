//
//  MockHomeInteractorDependencies.swift
//  ChallengeMeliTests
//
//  Created by Gustavo Aceredo on 12/6/23.
//

import Foundation
import Combine
@testable import ChallengeMeli

class MockHomeInteractorDependencies: HomeInteractorDependenciesProtocol {
    
    var listedItemsCalled = false
    var listedItemsQuery: [URLQueryItem]?
    var listedItemsFeedKind: Feed?
    var listedItemsReturnValue: AnyPublisher<CategoryItemsModel, RequestError>!
    
    func listedItems(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<CategoryItemsModel, RequestError> {
        listedItemsCalled = true
        listedItemsQuery = query
        listedItemsFeedKind = feedKind
        return listedItemsReturnValue
    }
    
    var searchItemsCalled = false
    var searchItemsQuery: [URLQueryItem]?
    var searchItemsFeedKind: Feed?
    var searchItemsReturnValue: AnyPublisher<CategoryItemsModel, RequestError>!
    
    func searchItems(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<CategoryItemsModel, RequestError> {
        searchItemsCalled = true
        searchItemsQuery = query
        searchItemsFeedKind = feedKind
        return searchItemsReturnValue
    }
}
