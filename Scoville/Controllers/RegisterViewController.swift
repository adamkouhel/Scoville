//
//  RegisterViewController.swift
//  Scoville
//
//  Created by Adam Kouhel on 10/16/17.
//  Copyright © 2017 AdamKouhel. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var container: UIView!
    
        @IBAction func btnRegister(_ sender: Any) {
    
            if let email = txtEmail.text, let password = txtPassword.text
            
        {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                // ...
                if user != nil {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                self.present(vc!, animated: true, completion: nil)
                }
            else{
                let alertController = UIAlertController(title: "Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
        
            }
            }
    }
    }
    }
    


