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
    var itemId: String
    var item: DetailsItemModel?
    var descriptionItem: DescriptionItemModel?
    var error: RequestError?
    private let interactor: DetailsInteractorProtocol
    
    init(interactor: DetailsInteractorProtocol,
         itemId: String) {
        self.interactor = interactor
        self.itemId = itemId
    }
    
    func detailsItem(completion: @escaping (Bool) -> Void) {
        interactor.detailsItem(id: itemId, query: []) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.item = success.item
                self.descriptionItem = success.description
                completion(true)
            case .failure(let failure):
                self.error = failure
                completion(false)
            }
        }
    }
}
