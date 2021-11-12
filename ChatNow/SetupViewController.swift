//
//  SetupViewController.swift
//  ChatNow
//
//  Created by David  on 11/4/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SetupViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpConfirm(_ sender: Any) {
        if emailField.text?.isEmpty == true {
            print("No text in email field")
            return
        }
        if passwordField.text?.isEmpty == true {
            print("No text in password field")
            return
        }
        
        signUp()
    }
    
    func signUp() {
      
        }
        
        
    }
    
/*
    @IBAction func alreadyHaveAccountLogin(_ sender: Any) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(identifier: "login")
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


