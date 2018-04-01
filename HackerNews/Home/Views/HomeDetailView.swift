//
//  HomeDetailView.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

class HomeDetailView: UIView {

    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var additionalDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        urlLabel.text = nil
        additionalDetailsLabel.text = nil
    }

}
