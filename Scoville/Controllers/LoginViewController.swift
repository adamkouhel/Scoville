//
//  LoginViewController.swift
//  Scoville
//
//  Created by Adam Kouhel on 10/16/17.
//  Copyright © 2017 AdamKouhel. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var container: UIView!

    @IBAction func btnLogin(_ sender: Any) {
        
        if let email = txtEmail.text, let password = txtPassword.text
        {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
             
                if user != nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
            }
        }
        
        
    }
    }
}
