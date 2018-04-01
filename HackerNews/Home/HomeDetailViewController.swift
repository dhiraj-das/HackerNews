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

    let options = PagingMenuOptions()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pagingMenuController = childViewControllers.first as? PagingMenuController else {
            assertionFailure("Child view controller must be an instance of PagingMenuController")
            return
        }
        pagingMenuController.setup(options)
    }
}
