//
//  DetailsViewController+Preview.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 10/6/23.
//

import SwiftUI

/* Validate the successful case */

private struct DetailsViewSuccessControllerRepresentable: UIViewControllerRepresentable {
    
    let viewController = DetailsWireFrame.makeDetailsView(id: "MLA1116667053")
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}


/* Validate the empty result case */

private struct DetailsViewEmptyControllerRepresentable: UIViewControllerRepresentable {
    
    let viewController = DetailsWireFrame.makeDetailsView(id: "")

    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

struct DetailsViewControllerPreivew: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsViewSuccessControllerRepresentable()
            DetailsViewEmptyControllerRepresentable()
        }
    }
}
