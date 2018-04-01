//
//  HomeViewController.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeView: HomeView!
    private let manager = HomeManager()
    private var isFetching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.delegate = self
        fetchTopStories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavigationBar()
    }
    
    private func fetchTopStories() {
        manager.fetchTopStories(offsetBy: 0) { (news, error) in
            guard error == nil else {
                //TODO: Show alert
                return
            }
            guard let _news = news else {
                //TODO: Show alert
                return
            }
            self.homeView.dataprovider = HomeDataProvider(news: _news)
        }
    }
    
    private func customizeNavigationBar() {
        navigationController?.navigationBar.barTintColor = .orange
        if let title = title {
            navigationItem.leftBarButtonItem = UINavigationBar.buttonItem(withTitle: title, subtitle: "just now")
        }
    }
    
    private func updateLastUpdatedSubtitle() {
        guard let navigationBarTitleView = navigationItem.leftBarButtonItem?.customView
            as? NavigationBarTitleView else { return }
        navigationBarTitleView.subTitle = "last updated"
    }
    
}

extension HomeViewController: HomeViewDelegate {
    
    func fetchStories() {
        guard isFetching == false else { return }
        isFetching = !isFetching
        guard let dataprovider = homeView.dataprovider else { return }
        manager.fetchTopStories(offsetBy: dataprovider.items.count) { (news, error) in
            self.isFetching = !self.isFetching
            guard error == nil else { return }
            guard let _news = news else { return }
            dataprovider.items.append(contentsOf: _news)
            self.homeView.refreshDataSource()
        }
    }
}
