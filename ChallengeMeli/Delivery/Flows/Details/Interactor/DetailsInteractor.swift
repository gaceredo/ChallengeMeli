//
//  DetailsInteractor.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import Foundation

protocol DetailsInteractorProtocol {
    
}

final class DetailsInteractor: DetailsInteractorProtocol {
    private let dependencies: DetailsInteractorDependenciesProtocol
    
    init(dependencies: DetailsInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
