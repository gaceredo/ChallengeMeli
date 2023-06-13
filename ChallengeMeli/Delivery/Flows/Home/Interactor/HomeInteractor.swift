//
//  HomeInteractor.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import Foundation
import Combine

protocol HomeInteractorProtocol {
    func listedItems(siteId: String, query: [URLQueryItem], completion: @escaping (Result<CategoryItemsModel, RequestError>) -> Void)
    func searchItems(siteId: String, query: [URLQueryItem], completion: @escaping (Result<CategoryItemsModel, RequestError>) -> Void)
}

final class HomeInteractor: HomeInteractorProtocol {
    
    private let dependencies: HomeInteractorDependenciesProtocol
    private var cancellable: AnyCancellable?
    
    init(dependencies: HomeInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func listedItems(siteId: String,
                     query: [URLQueryItem],
                     completion: @escaping (Result<CategoryItemsModel, RequestError>) -> Void) {
        
        cancellable = dependencies.listedItems(query: query, .listedItems(siteId: siteId))
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure(let error):
                    completion(.failure(error))
                }
            },receiveValue: {
                completion(.success($0))
            })
    }
    
    func searchItems(siteId: String,
                     query: [URLQueryItem],
                     completion: @escaping (Result<CategoryItemsModel, RequestError>) -> Void) {
        
        cancellable = dependencies.searchItems(query: query, .searchItems(siteId: siteId))
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure(let error):
                    completion(.failure(error))
                }
            },receiveValue: {
                completion(.success($0))
            })
    }
}
