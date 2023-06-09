//
//  DetailsViewController.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var presenter: DetailsPresenter
    
    init(presenter: DetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsItem()
    }
    
    func detailsItem() {
        presenter.detailsItem(completion: { [weak self] isSuccess in
            guard let self = self else { return }
            
        })
    }
}
