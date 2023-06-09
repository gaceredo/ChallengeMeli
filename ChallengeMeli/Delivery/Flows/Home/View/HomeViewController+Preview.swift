//
//  HomeViewController+Preview.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import SwiftUI

/* Validate the successful case */

private struct HomeViewSuccessControllerRepresentable: UIViewControllerRepresentable {
    
    let viewController = HomeWireFrame.makeHomeView(siteId: "MLA", categoryId: "MLA1055")
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}


/* Validate the empty result case */

private struct HomeViewEmptyControllerRepresentable: UIViewControllerRepresentable {
    
    let viewController = HomeWireFrame.makeHomeView(siteId: "MLU", categoryId: "MLA1055")

    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

struct ViewControllerPreivew: PreviewProvider {
    static var previews: some View {
        Group {
            HomeViewSuccessControllerRepresentable()
            HomeViewEmptyControllerRepresentable()
        }
    }
}
