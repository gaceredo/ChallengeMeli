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
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        searchBar.tintColor = .black
        return searchBar
    }()
    
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
        configureSearchBarButton()
    }
    
    func listedItems() {
        showHud()
        presenter.listedItems { [weak self] isSuccess in
            guard let self = self else { return }
            isSuccess ? collectionView.reloadData() : Alert.showEmptyAlert(on: self, handler: reloadList)
            hideHud()
        }
    }
    
    func searchItems(text: String) {
        showHud()
        presenter.searchItems(text: text) { [weak self] isSuccess in
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
    
    func configureSearchBar() {
        presenter.isActiveSearch = true
        presenter.clearValues()
        collectionView.reloadData()
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
    
    func configureSearchBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func showSearchBar() {
        configureSearchBar()
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        configureSearchBarButton()
        presenter.isActiveSearch = false
        presenter.clearValues()
        collectionView.reloadData()
        listedItems()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        searchItems(text: text)
    }
}
