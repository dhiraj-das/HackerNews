//
//  LoginViewController.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    @IBOutlet var loginView: LoginView!
    
    var authManager: AuthManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        authManager = AuthManager()
    }
    
}

extension LoginViewController: GIDSignInUIDelegate {}

extension LoginViewController: LoginViewDelegate {
    
    func didTapOnPhoneAuthButton(phoneNo: String) {
        authManager.signInWith(phoneNumber: phoneNo, fromViewController: self)
    }
    
    func didTapOnGoogleAuthButton() {
        authManager.signInWithGoogle()
    }
}
