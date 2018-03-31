//
//  LoginView.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func didTapOnPhoneAuthButton()
    func didTapOnGoogleAuthButton()
}

class LoginView: UIView {
    
    @IBOutlet weak var googleAuthButton: UIButton!
    @IBOutlet weak var phoneAuthButton: UIButton!
    
    weak var delegate: LoginViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func didTapOnGoogleAuthButton(_ sender: Any) {
        delegate?.didTapOnGoogleAuthButton()
    }
    
    @IBAction func didTapOnPhoneAuthButton(_ sender: Any) {
        delegate?.didTapOnPhoneAuthButton()
    }
    
}
