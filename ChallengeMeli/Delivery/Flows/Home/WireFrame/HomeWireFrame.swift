//
//  HomeWireFrame.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import UIKit

protocol HomeWireFrameProtocol {
   static func makeHomeView() -> UIViewController
}

struct HomeWireFrame: HomeWireFrameProtocol {
    static func makeHomeView() -> UIViewController {
        
        let interactorDependencies = HomeInteractorDependencies()
        let interactor = HomeInteractor(dependencies: interactorDependencies)
        let presenter = HomePresenter(interactor: interactor)
        let view = HomeViewController(presenter: presenter)
        
        return view
    }
}
