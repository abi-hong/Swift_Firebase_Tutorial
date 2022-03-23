//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by 홍희수 on 2022/03/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Auth.auth().currentUser != nil {
            guard let welcomeVC = self.storyboard?.instantiateViewController(identifier: "WelcomeVC") as? WelcomeVC else {return}
            
            self.navigationController?.pushViewController(welcomeVC, animated: true)
            
            //emailTextField.placeholder = "이미 로그인 된 상태입니다."
            //pwTextField.placeholder = "이미 로그인 된 상태입니다."
        }
    }
    
    @IBAction func signInButton(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let pw = pwTextField.text, !pw.isEmpty else {
            print("이메일과 패스워드를 입력해주세요.")
            return
        }
        Auth.auth().signIn(withEmail: email, password: pw) { user, error in
            
            if user != nil {
                print("login success!")
                guard let welcomeVC = self.storyboard?.instantiateViewController(identifier: "WelcomeVC") as? WelcomeVC else {return}
                
                self.navigationController?.pushViewController(welcomeVC, animated: true)
            }
            else {
                print("login fail")
            }
            
        }
    }
    
}

