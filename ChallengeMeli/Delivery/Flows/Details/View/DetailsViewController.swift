//
//  DetailsViewController.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//  
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    var presenter: DetailsPresenter
    
    init(presenter: DetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        detailsItem()
    }
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(DescriptionItemTableViewCell.self)
        tableView.registerNib(CarruselImagesTableViewCell.self)
        tableView.registerNib(PriceItemTableViewCell.self)
        tableView.registerNib(AttributesItemTableViewCell.self)
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65.0
    }
    
    func detailsItem() {
        showHud()
        presenter.detailsItem(completion: { [weak self] isSuccess in
            guard let self = self else { return }
            isSuccess ? tableView.reloadData() : Alert.showEmptyAlert(on: self, handler: reloadList)
            hideHud()
        })
    }
    
    @objc func reloadList(_ sender: UIAlertAction) {
        detailsItem()
    }
}
