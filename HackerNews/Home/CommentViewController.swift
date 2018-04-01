//
//  CommentViewController.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit
import JGProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet var commentView: CommentView!
    
    private lazy var progressHud = JGProgressHUD(style: .dark)
    private let manager = HomeManager()
    var commentIds: [Int]? {
        didSet {
            fetchComments()
        }
    }
    
    private func fetchComments() {
        guard let _commentIds = commentIds else { return }
        progressHud.show(in: self.view)
        manager.fetchComments(kids: _commentIds) { (comments, error) in
            self.progressHud.dismiss()
            guard error == nil else {
                //TODO: Show alert
                return
            }
            guard let _comments = comments else {
                //TODO: Show alert
                return
            }
            self.commentView.items = _comments
        }
    }
}
