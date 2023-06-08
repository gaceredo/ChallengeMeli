//
//  HomePresenter.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import Foundation
import Combine

protocol HomePresenterProtocol {
    var result: [String] { get set }
}

final class HomePresenter: HomePresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: HomeInteractorProtocol
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
}
