//
//  FormViewController.swift
//  UnittestingPractice
//
//  Created by TTN on 04/08/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

protocol AddDataProtocol {
    func sendData(dataEntry : UserListViewController.UserDetails)
}


class FormViewController: UIViewController {

    

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var user10Marks: UITextField!
    @IBOutlet weak var user12Marks: UITextField!
    @IBOutlet weak var userPhoneNumber: UITextField!
    
    var dataDelegate : AddDataProtocol? = nil
    
    var val = Validationfunction()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func submitBtnTapped(_ sender: Any) {
        
        let provideName = self.userName.text
        
        let validname = val.isValidName(nameString: provideName!)
        
        if validname
        {
            print("Name is valid")
        } else {
            displayAlertMessage(messageToDisplay: "Pleaase Enter your Proper Name")
            return
        }
        
        let provideEmail = self.userEmail.text
        let validEmail = val.isValidEmailAddress(emailAddressString: provideEmail!)
        
        if validEmail
        {
            print("Email address is valid")
        } else {
            displayAlertMessage(messageToDisplay: "Email address is not valid")
            return
        }
        
        let provide10Marks = self.user10Marks.text!
        let valid10marks = val.isValidMarks(marksStirng: provide10Marks)
        if valid10marks
        {
            print("10th marks is valid")
        } else {
            displayAlertMessage(messageToDisplay: "10th Marks is not valid")
            return
        }
        
        let provide12Marks = self.user12Marks.text!
        let valid12Marks = val.isValidMarks(marksStirng: provide12Marks)
        if valid12Marks
        {
            print("12th marks is valid")
        } else {
            displayAlertMessage(messageToDisplay: "12th Marks is not valid")
            return
        }
        
        let provideNumber = self.userPhoneNumber.text!
        let validNum = val.isValidNumber(numberString: provideNumber)
        if validNum
        {
            print("mobile Number is valid")
        } else {
            displayAlertMessage(messageToDisplay: "Mobile Number is not valid")
            return
        }
        
        let newData = UserListViewController.UserDetails(name :  provideName!, email :  provideEmail!, marks10 :  self.user10Marks.text!, marks12 :  self.user12Marks.text!, mobileNumber :  self.userPhoneNumber.text!)
        self.dataDelegate?.sendData(dataEntry: newData)
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension FormViewController {
    
    //alert controller for invalid data entry
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }

}
