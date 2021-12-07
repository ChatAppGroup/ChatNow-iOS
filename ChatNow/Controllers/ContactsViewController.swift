//
//  ContactsViewController.swift
//  ChatNow
//
//  Created by David  on 11/4/21.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    
    @IBOutlet weak var searchCancel: UIButton!
    
    @IBOutlet weak var contactsTV: UITableView!
    
    @IBOutlet weak var searchName: UISearchBar!
    
    let contactNames = ["John","Bin", "Sam", "ron", "Nick", "Jones", "Har"]
    var searchPerson = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTV.delegate=self
        contactsTV.dataSource=self
        searchName.delegate = self

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching{
          return searchPerson.count
        }
        else{
           return contactNames.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contactsTV.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        
        if searching {
            cell.name.text = searchPerson[indexPath.row]
        }
        else {
            cell.name.text = contactNames[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "chatSegue", sender: self)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         searchPerson = contactNames.filter({$0.prefix(searchText.count) == searchText})
         searching=true
        self.contactsTV.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text=""
        contactsTV.reloadData()
    }

}
