//
//  ArticleViewController.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    var url: URL? {
        didSet {
            loadURL()
        }
    }

    private func loadURL() {
        guard let _url = url else { return }
        let urlRequest = URLRequest(url: _url)
        webview.loadRequest(urlRequest)
    }
}
