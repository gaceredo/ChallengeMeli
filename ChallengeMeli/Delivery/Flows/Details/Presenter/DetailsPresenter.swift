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
    var cells: [CellsItem] { get set }
    var item: DetailsItemModel? { get set }
    var descriptionItem: DescriptionItemModel? { get set }
    var error: RequestError? { get set }
    
    func detailsItem(completion: @escaping (Bool) -> Void)
    func setupCell()
}

final class DetailsPresenter: DetailsPresenterProtocol, ObservableObject {
    
    var item: DetailsItemModel?
    var descriptionItem: DescriptionItemModel?
    var error: RequestError?
    var cells: [CellsItem] = []
    
    private let interactor: DetailsInteractorProtocol
    private var itemId: String
    
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
                self.setupCell()
                completion(true)
            case .failure(let failure):
                self.error = failure
                completion(false)
            }
        }
    }
    
    func setupCell() {
        cells.append(.carrusel)
        cells.append(.price)
        cells.append(.description)
        if let attributes = item?.attributes,
           !attributes.isEmpty {
            cells.append(.attributes)
        }
    }
}

enum CellsItem {
    case carrusel
    case description
    case price
    case attributes
}
