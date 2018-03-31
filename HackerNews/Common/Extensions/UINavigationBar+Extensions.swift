//
//  UINavigationBar+Extensions.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    class func buttonItem(withTitle title: String?, subtitle: String?) -> UIBarButtonItem {
        let titleView = NavigationBarTitleView.viewFromNib()
        titleView.frame = CGRect.init(origin: .zero, size: CGSize(width: 100, height: 40))
        let barButton = UIBarButtonItem.init(customView: titleView)
        titleView.title = title
        titleView.subTitle = subtitle
        return barButton
    }
}
