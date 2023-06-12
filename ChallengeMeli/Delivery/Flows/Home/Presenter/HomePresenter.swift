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
    var error: RequestError { get set }
    var elements: [HomeItemModel] { get set }
    var filterElements: [HomeItemModel] { get set }
    var isActiveSearch: Bool { get set }
    var isLoding: Bool { get set }
    var offset: Int { get set }
    func clearValues()
    func listedItems(completion: @escaping (Bool) -> Void)
    func searchItems(text: String, completion: @escaping (Bool) -> Void)
}

final class HomePresenter: HomePresenterProtocol {
    
    var error: RequestError = RequestError.default
    var isLoding: Bool = false
    var offset: Int = 0
    var elements: [HomeItemModel] = []
    var filterElements: [HomeItemModel] = []
    var isActiveSearch: Bool = false
    
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
       
        let query = [URLQueryItem(name: Localizable.HomeView.category.localized, value: categoryId),
                     URLQueryItem(name: Localizable.HomeView.offset.localized, value: offset.description)]
        
        lodingTogler()
        interactor.listedItems(siteId: siteId, query: query) { [weak self] result in
            guard let self = self else { return }
            self.lodingTogler()
            switch result {
            case .success(let success):
                self.elements.append(contentsOf: success.results)
                self.offset = success.paging.limit + success.paging.offset
                completion(!success.results.isEmpty)
            case .failure(let failure):
                self.error = failure
                completion(false)
            }
        }
    }
   
    func searchItems(text: String,
                     completion: @escaping (Bool) -> Void) {
       
        let query = [URLQueryItem(name: Localizable.DetailsView.q.localized,
                                  value: text)]
        
        lodingTogler()
        interactor.searchItems(siteId: siteId, query: query) { [weak self] result in
            guard let self = self else { return }
            self.lodingTogler()
            switch result {
            case .success(let success):
                self.filterElements.append(contentsOf: success.results)
                self.offset = success.paging.limit + success.paging.offset
                completion(!success.results.isEmpty)
            case .failure(let failure):
                self.error = failure
                completion(false)
            }
        }
    }
    
    
    private func lodingTogler() {
        self.isLoding = !self.isLoding
    }

    func clearValues() {
        self.offset = 0
        self.elements = []
        self.filterElements = []
    }
}
