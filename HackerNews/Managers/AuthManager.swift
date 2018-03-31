//
//  AuthManager.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Firebase
import FirebasePhoneAuthUI
import GoogleSignIn

protocol AuthManagerDelegate: class {
    func didSignIn(success: Bool, error: Error?)
}

class AuthManager: NSObject {
    
    private var authUI: FUIAuth!
    weak var delegate: AuthManagerDelegate?
    
    var currentUser: User? {
        return FUIAuth.defaultAuthUI()?.auth?.currentUser
    }
    
    var isLoggedIn: Bool {
        return currentUser != nil
    }
    
    override init() {
        super.init()
        guard let authUI = FUIAuth.defaultAuthUI() else { return }
        self.authUI = authUI
        let providers: [FUIAuthProvider] = [FUIPhoneAuth(authUI: authUI)]
        authUI.providers = providers
        authUI.delegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func signInWith(phoneNumber: String, fromViewController viewcontroller: UIViewController) {
        guard let phoneProvider = FUIAuth.defaultAuthUI()?.providers.first as? FUIPhoneAuth else { return }
        phoneProvider.signIn(withPresenting: viewcontroller, phoneNumber: phoneNumber)
    }
    
    func signInWithGoogle() {
        GIDSignIn.sharedInstance().signIn()
    }
}

extension AuthManager: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        delegate?.didSignIn(success: authDataResult?.user != nil, error: error)
    }
}

extension AuthManager: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else {
            delegate?.didSignIn(success: false, error: error)
            return
        }
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user, error) in
            self.delegate?.didSignIn(success: user != nil, error: error)
        }
    }
}

