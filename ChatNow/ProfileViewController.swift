//
//  ProfileViewController.swift
//  ChatNow
//
//  Created by David  on 11/4/21.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var usernameLbl: UILabel!
    
    @IBOutlet weak var statusLbl: UILabel!
    
    @IBOutlet weak var statusField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusField.isHidden = true
        if let username = UserDefaults.standard.string(forKey: "userName"){
            usernameLbl.text = username
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editProfile(_ sender: Any) {
        statusField.isHidden = false
    }
    
}
