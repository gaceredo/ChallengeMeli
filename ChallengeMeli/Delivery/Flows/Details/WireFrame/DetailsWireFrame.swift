//
//  DetailsWireFrame.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import UIKit

protocol DetailsWireFrameProtocol {
   static func makeDetailsView() -> UIViewController
}

struct DetailsWireFrame: DetailsWireFrameProtocol {
    static func makeDetailsView() -> UIViewController {
        
        let interactorDependencies = DetailsInteractorDependencies()
        let interactor = DetailsInteractor(dependencies: interactorDependencies)
        let presenter = DetailsPresenter(interactor: interactor)
        let view = DetailsViewController(presenter: presenter)
        
        return view
    }
}
