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
    
  

    @IBAction func onSignIn(_ sender: Any) {
        let email = emailField.text!
        let password = passwordField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) {
           [weak self] authResult, error in
            guard let strongSelf = self else
            {
                return
                
            }
        }
        
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let email = emailField.text!
        let password = passwordField.text!
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if(error != nil) {
                print("User not created")
                return
            }
            print("User created")
        }
        
       
            /*
            let board = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard?.instantiateViewController(identifier: "mainTab")
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
 */
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


