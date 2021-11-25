//
//  ContactsTableViewCell.swift
//  ChatNow
//
//  Created by Chandana Pemmasani on 11/24/21.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
