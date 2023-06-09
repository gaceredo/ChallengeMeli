//
//  DetailsInteractor.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import Foundation
import Combine

protocol DetailsInteractorProtocol {
    func detailsItem(id: String, query: [URLQueryItem],
                     completion: @escaping (Result<(item: DetailsItemModel,description: DescriptionItemModel), RequestError>) -> Void)
}

final class DetailsInteractor: DetailsInteractorProtocol {
    
    private let dependencies: DetailsInteractorDependenciesProtocol
    private var cancellable: AnyCancellable?
    
    init(dependencies: DetailsInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func detailsItem(id: String,
                     query: [URLQueryItem],
                     completion: @escaping (Result<(item: DetailsItemModel, description: DescriptionItemModel) , RequestError>) -> Void) {
        
        cancellable = dependencies.detailsItem(query: query, .detailsItem(id: id))
            .zip(dependencies.descriptionItem(query: query, .detailsDescriptionItem(id: id)))
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
