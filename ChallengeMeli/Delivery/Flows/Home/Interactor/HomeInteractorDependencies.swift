//
//  HomeInteractorDependencies.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import Foundation
import Combine


protocol HomeInteractorDependenciesProtocol {
    func listedItems(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<CategoryItemsModel, RequestError>
    func searchItems(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<CategoryItemsModel, RequestError>
}

class HomeInteractorDependencies: RequestProtocol, HomeInteractorDependenciesProtocol {
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }

    func listedItems(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<CategoryItemsModel, RequestError> {
        execute(feedKind.request(query: query), decodingType: CategoryItemsModel.self)
    }
    func searchItems(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<CategoryItemsModel, RequestError> {
        execute(feedKind.request(query: query), decodingType: CategoryItemsModel.self)
    }
}
