//
//  SignUpVC.swift
//  FirebaseLogin
//
//  Created by 홍희수 on 2022/03/23.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signUpButtonTouched(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: pwTextField.text!
                               
        ) { (user, error) in
            
            if user !=  nil{
                print("register success")
            }
            
            else{
                print("register failed")
            }
            
        }
    }
    
}
