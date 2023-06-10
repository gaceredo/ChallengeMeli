//
//  HomeViewController.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    var presenter: HomePresenter
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listedItems()
        setupUI()
    }
    
    func listedItems() {
        showHud()
        presenter.listedItems { [weak self] isSuccess in
            guard let self = self else { return }
            isSuccess ? collectionView.reloadData() : Alert.showEmptyAlert(on: self, handler: reloadList)
            hideHud()
        }
    }
    
    @objc func reloadList(_ sender: UIAlertAction) {
        listedItems()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 18)
    }
    
    func setupUI() {
        title = Localizable.HomeView.title.localized
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(HomeItemCollectionViewCell.self)
    }
}
