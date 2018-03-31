//
//  HomeView.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: class {
    
}

class HomeView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: HomeViewDelegate?
    
    var dataprovider: HomeDataProvider? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = HomeTableViewCell.Dimensions.cellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: HomeTableViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            as? HomeTableViewCell else { return HomeTableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataprovider?.items.count ?? 0
    }
}

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Handle This.
    }
}
