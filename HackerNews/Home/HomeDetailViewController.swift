//
//  HomeDetailViewController.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit
import PagingMenuController

class HomeDetailViewController: BaseViewController {

    @IBOutlet var homeDetailView: HomeDetailView!
    
    let options = PagingMenuOptions()
    var pagingMenuController: PagingMenuController?
    var newsItem: Item?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPagingMenuController()
        updateData()
    }
    
    func updateData() {
        guard let data = newsItem else { return }
        homeDetailView.urlLabel.text = data.url?.absoluteString
        homeDetailView.additionalDetailsLabel.text = "\(data.datetime) | \(data.userName)"
    }
    
    private func setupPagingMenuController() {
        guard let _pagingMenuController = childViewControllers.first as? PagingMenuController else {
            assertionFailure("child view controller must be an instance of PagingMenuController")
            return
        }
        pagingMenuController = _pagingMenuController
        _pagingMenuController.setup(options)
        passDataToChildViewControllers()
    }
    
    private func passDataToChildViewControllers() {
        guard let viewControllers = pagingMenuController?.pagingViewController?.controllers else { return }
        for (_, viewController) in viewControllers.enumerated() {
            if let commentVC = viewController as? CommentViewController {
                commentVC.commentIds = newsItem?.commentIds
            }
            
            if let articleVC = viewController as? ArticleViewController {
                articleVC.url = newsItem?.url
            }
        }
    }
    
    private func customizeNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        if let news = newsItem {
            navigationItem.title = news.title
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
    }
}
