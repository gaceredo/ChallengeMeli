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
    var result: CategoryItemsModel? { get set }
    var error: RequestError { get set }
}

final class HomePresenter: HomePresenterProtocol {
    
    var error: RequestError = RequestError.default
    var isLoding: Bool = false
    var offset: Int = 0
    var elements: [HomeItemModel] = []
    var result: CategoryItemsModel? = nil {
        didSet {
            self.elements.append(contentsOf: result?.results ?? [])
        }
    }
    private var siteId: String
    private var categoryId: String
    private let interactor: HomeInteractorProtocol
    
    init(interactor: HomeInteractorProtocol,
         siteId: String, categoryId: String) {
        self.interactor = interactor
        self.siteId = siteId
        self.categoryId = categoryId
    }
    
    func listedItems(completion: @escaping (Bool) -> Void) {
       
        
        let query = [URLQueryItem(name: "category", value: categoryId),
                     URLQueryItem(name: "offset", value: offset.description)]
        lodingTogler()
        interactor.listedItems(siteId: siteId, query: query) { [weak self] result in
            guard let self = self else { return }
            self.lodingTogler()
            switch result {
            case .success(let success):
                self.result = success
                self.offset = success.paging.limit + success.paging.offset
                completion(true)
            case .failure(let failure):
                self.error = failure
                completion(false)
            }
        }
    }
    
    func lodingTogler() {
        self.isLoding = !self.isLoding
    }
}
