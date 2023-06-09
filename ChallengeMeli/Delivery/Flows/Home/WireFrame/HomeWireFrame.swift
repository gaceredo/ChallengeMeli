//
//  HomeWireFrame.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import UIKit

protocol HomeWireFrameProtocol {
   static func makeHomeView(siteId: String, categoryId: String) -> UIViewController
}

struct HomeWireFrame: HomeWireFrameProtocol {
    static func makeHomeView(siteId: String, categoryId: String) -> UIViewController {
        
        let interactorDependencies = HomeInteractorDependencies()
        let interactor = HomeInteractor(dependencies: interactorDependencies)
        let presenter = HomePresenter(interactor: interactor, siteId: siteId, categoryId: categoryId )
        let view = HomeViewController(presenter: presenter)
        
        return view
    }
}
