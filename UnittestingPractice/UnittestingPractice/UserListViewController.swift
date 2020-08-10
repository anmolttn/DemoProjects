//
//  UserListViewController.swift
//  UnittestingPractice
//
//  Created by TTN on 04/08/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController,AddDataProtocol {

    @IBOutlet weak var userList: UITableView!
    
    var dataDelegate : AddDataProtocol? = nil
    
    //structure to store data
    public struct UserDetails{
        var name : String
        var email : String
        var marks10 : String
        var marks12 : String
        var mobileNumber : String
    }

    var dataArray : [UserDetails] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))


        //register the nib file of table vview cell
        let nib = UINib(nibName: "UserListTableViewCell", bundle: nil)
        userList.register(nib, forCellReuseIdentifier: "UserListTableViewCell")
        
        //deleagate and data datasource of table view
        userList.delegate = self
        userList.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        userList.reloadData()
    }
    
    
    //action of naviagtion button
    @objc func addTapped(){
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
        vc.dataDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    //protocol function
    func sendData(dataEntry: UserDetails) {
        dataArray.append(dataEntry)
        print(dataArray)
    }

}

//Marks : extension for table view delegate and data source
extension UserListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataArray.count )
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "User List With Valid data"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userList.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        cell.dataAdd(name: "Name : \(dataArray[indexPath.row].name)", email: "Email : \(dataArray[indexPath.row].email)", marks10: "10th Marks : \(dataArray[indexPath.row].marks10)", marks12: "12th marks : \(dataArray[indexPath.row].marks12)", userMobile: "Mobile Number : \(dataArray[indexPath.row].mobileNumber)")
        return cell
    }
    
    
}
