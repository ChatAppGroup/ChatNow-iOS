//
//  MessagesViewController.swift
//  ChatNow
//
//  Created by David  on 11/4/21.
//

import UIKit

class MessagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logOutAction(_ sender: Any) {
        
        UserDefaults.standard.setValue(false, forKey: "loggedin")
        self.dismiss(animated: true, completion: nil )
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
