//
//  DetailsInteractorDependencies.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import Foundation
import Combine

protocol DetailsInteractorDependenciesProtocol {
    func detailsItem(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<DetailsItemModel, RequestError>
    func descriptionItem(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<DescriptionItemModel, RequestError>
}

class DetailsInteractorDependencies: RequestProtocol, DetailsInteractorDependenciesProtocol {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }

    func detailsItem(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<DetailsItemModel, RequestError> {
        execute(feedKind.request(query: query), decodingType: DetailsItemModel.self)
    }
    
    func descriptionItem(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher<DescriptionItemModel, RequestError> {
        execute(feedKind.request(query: query), decodingType: DescriptionItemModel.self)
    }
}

