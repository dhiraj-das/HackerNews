//
//  LoginView.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func didTapOnPhoneAuthButton(phoneNo: String)
    func didTapOnGoogleAuthButton()
}

class LoginView: UIView {
    
    @IBOutlet weak var googleAuthButton: UIButton!
    @IBOutlet weak var phoneAuthButton: UIButton!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    weak var delegate: LoginViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        phoneNoTextField.addTarget(self,
                                   action: #selector(SELisPhoneNoValid(sender:)),
                                   for: .editingChanged)
    }
    
    @IBAction func didTapOnSubmitButton(_ sender: Any) {
        guard let phoneNo = phoneNoTextField.text else { return }
        delegate?.didTapOnPhoneAuthButton(phoneNo: phoneNo)
    }
    
    @IBAction func didTapOnGoogleAuthButton(_ sender: Any) {
        delegate?.didTapOnGoogleAuthButton()
    }
    
    @IBAction func didTapOnPhoneAuthButton(_ sender: Any) {
        phoneNoTextField.isHidden = false
        submitButton.isHidden = false
        phoneNoTextField.becomeFirstResponder()
    }
    
    @objc private func SELisPhoneNoValid(sender: UITextField) {
        guard let phoneNo = sender.text, phoneNo.count > 9 else {
            submitButton.isEnabled = false
            return
        }
        submitButton.isEnabled = true
    }
}
