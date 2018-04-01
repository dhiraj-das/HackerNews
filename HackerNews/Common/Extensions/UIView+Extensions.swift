//
//  UIView+Extensions.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> Self? {
        return loadWithNib(nibNamed: nibNamed, bundle: bundle)
    }
    
    private class func loadWithNib<T>(nibNamed: String, bundle : Bundle? = nil) -> T? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil).first as? T
    }
}
