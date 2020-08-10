//
//  UserListTableViewCell.swift
//  UnittestingPractice
//
//  Created by TTN on 04/08/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var user10Marks: UILabel!
    @IBOutlet weak var user12Marks: UILabel!
    @IBOutlet weak var userMobile: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func dataAdd(name: String, email : String, marks10 : String, marks12 : String, userMobile : String){
        self.userName.text = name
        self.userEmail.text = email
        self.user10Marks.text = marks10
        self.user12Marks.text = marks12
        self.userMobile.text = userMobile
    }
    
}
