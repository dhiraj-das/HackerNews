//
//  NavigationBarTitleView.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

class NavigationBarTitleView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var title: String? {
        didSet {
            guard let _title = title else { return }
            titleLabel.text = _title
        }
    }
    
    var subTitle: String? {
        didSet {
            guard let _subtitle = subTitle else { return }
            subtitleLabel.text = _subtitle
        }
    }
    
    static func viewFromNib() -> NavigationBarTitleView {
        guard let viewFromNib = NavigationBarTitleView.loadFromNibNamed(nibNamed: String(describing: NavigationBarTitleView.self)) else {
            assert(false, "Unknown XIB")
            return NavigationBarTitleView()
        }
        return viewFromNib
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title = ""
        subTitle = ""
    }
}
