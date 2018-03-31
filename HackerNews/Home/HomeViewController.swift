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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavigationBar()
    }
    
    private func customizeNavigationBar() {
        navigationController?.navigationBar.barTintColor = .orange
        if let title = title {
            navigationItem.leftBarButtonItem = UINavigationBar.buttonItem(withTitle: title, subtitle: "nil")
        }
    }
    
    private func updateLastUpdatedSubtitle() {
        guard let navigationBarTitleView = navigationItem.leftBarButtonItem?.customView
            as? NavigationBarTitleView else { return }
        navigationBarTitleView.subTitle = "last updated"
    }
    
}
