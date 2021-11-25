//
//  MessagesViewController.swift
//  ChatNow
//
//  Created by David  on 11/4/21.
//

import UIKit
import FirebaseAuth

class MessagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MessageCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        DatabaseManager.shared.test()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapOnContacts(_ sender: Any) {
        
        self.performSegue(withIdentifier: "contactsScreen", sender: self)
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        
//        FirebaseAuth.Auth.auth().currentUser = nil
        UserDefaults.standard.setValue(false, forKey: "loggedin")
        self.dismiss(animated: true, completion: nil )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        cell.textLabel?.text = "David"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false )
    }
    
    
    
}
