//
//  LoginViewController.swift
//  ChatNow
//
//  Created by David  on 11/4/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
 
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "loggedin") == true {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    @IBAction func onSignUp(_ sender: Any) {
//
//
////        let email = emailField.text!
////        let password = passwordField.text!
////
////
////        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
////            if(error != nil) {
////                print("User not created")
////                return
////            }
////            print("User created")
//        }
    @IBAction func onSignUp(_ sender: Any) {
        
        self.performSegue(withIdentifier: "signUpSegue", sender: self)
        
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let email = emailField.text!
        let password = passwordField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) {
           [weak self] authResult, error in
            if error == nil{
                UserDefaults.standard.set(true, forKey: "loggedin")
                UserDefaults.standard.set(email, forKey: "userName")
                    self?.performSegue(withIdentifier: "loginSegue", sender: self)
            }
            else{
                print("error in login")
                return
            }
            guard let strongSelf = self else
            {
                return
            }
        }

    }
    
    
   
        
       
            /*
            let board = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard?.instantiateViewController(identifier: "mainTab")
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
 */
    }
