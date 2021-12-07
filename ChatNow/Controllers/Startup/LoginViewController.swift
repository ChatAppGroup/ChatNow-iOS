//
//  LoginViewController.swift
//  ChatNow
//
//  Created by David on 12/7/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Log in"
        view.backgroundColor = .white
       
        //Add subviews
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.width/3
        imageView.frame = CGRect(x: (view.width - size)/2, y: 150, width: size, height: size)
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
}
