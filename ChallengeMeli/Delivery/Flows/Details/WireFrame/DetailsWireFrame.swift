//
//  DetailsWireFrame.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import UIKit

protocol DetailsWireFrameProtocol {
    static func makeDetailsView(id: String) -> UIViewController
}

struct DetailsWireFrame: DetailsWireFrameProtocol {
    static func makeDetailsView(id: String) -> UIViewController {
        
        let interactorDependencies = DetailsInteractorDependencies()
        let interactor = DetailsInteractor(dependencies: interactorDependencies)
        let presenter = DetailsPresenter(interactor: interactor, itemId: id)
        let view = DetailsViewController(presenter: presenter)
        
        return view
    }
}
