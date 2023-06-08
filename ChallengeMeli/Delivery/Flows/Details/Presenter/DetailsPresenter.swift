//
//  DetailsPresenter.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import Foundation
import Combine

protocol DetailsPresenterProtocol {
    var result: [String] { get set }
}

final class DetailsPresenter: DetailsPresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: DetailsInteractorProtocol
    
    init(interactor: DetailsInteractorProtocol) {
        self.interactor = interactor
    }
}
