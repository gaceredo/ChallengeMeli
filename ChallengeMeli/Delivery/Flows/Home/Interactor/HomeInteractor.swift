//
//  HomeInteractor.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import Foundation

protocol HomeInteractorProtocol {
    
}

final class HomeInteractor: HomeInteractorProtocol {
    private let dependencies: HomeInteractorDependenciesProtocol
    
    init(dependencies: HomeInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
