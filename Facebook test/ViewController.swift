//
//  ViewController.swift
//  Facebook test
//
//  Created by Timothy Head on 07/11/2019.
//  Copyright © 2019 Timothy Head. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error!)
        } else if result!.isCancelled {
            print("user has canceled login")
        } else {
            if (result?.grantedPermissions.contains("email"))! {
                 let graphResult = GraphRequest(graphPath: "me", parameters: ["fields": "email,name"])
                graphResult.start { (connection, result, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        if let userDeets = result {
                            print(userDeets)
                        }
                    }
                }
            }
        }
            
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logout")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        loginButton.permissions = ["public_profile", "email"]
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        Settings.appID =  "404459930463566"
        
    }


}

