//
//  HomeView.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: class {
    func fetchStories()
    func didTapNewsItem(item: News)
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

    func refreshDataSource() {
        tableView.reloadData()
    }
}

extension HomeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: HomeTableViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            as? HomeTableViewCell else { return HomeTableViewCell() }
        cell.cellData = dataprovider?.items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataprovider?.items.count ?? 0
    }
}

extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _dataprovider = dataprovider else { return }
        delegate?.didTapNewsItem(item: _dataprovider.items[indexPath.row])
    }
}

extension HomeView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let visibleIndexPaths = tableView.indexPathsForVisibleRows else { return }
        guard let rowIndex = visibleIndexPaths.last?.row else { return }
        guard let _dataprovider = dataprovider else { return }
        if rowIndex > _dataprovider.items.count - 20 {
            delegate?.fetchStories()
        }
    }
}
