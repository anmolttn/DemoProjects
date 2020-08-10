//
//  UserDataValidate.swift
//  UnittestingPractice
//
//  Created by TTN on 04/08/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import Foundation


public class Validationfunction {
    
    //functionn to validate the name of the user
    func isValidName(nameString : String) -> Bool {
        
        var returnValue = true
        let nameRegEx = "[A-Za-z]"
        
        do {
            let regex = try NSRegularExpression(pattern: nameRegEx)
            let nsString = nameString as NSString
            let results = regex.matches(in: nameString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }

    //functionn to validate the eamil of the user
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    //functionn to validate the marks of the user
    func isValidMarks(marksStirng : String) -> Bool {
        let marksRegEx = "[0-9]"
        
        do {
            let regex = try NSRegularExpression(pattern: marksRegEx)
            let nsString = marksStirng as NSString
            let results = regex.matches(in: marksStirng, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 2
            {
                return true
            }
            else{
                return false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return false
        }
    }

    //functionn to validate the Mobile Number of the user
    func isValidNumber(numberString: String) -> Bool {
        let phoneRegex = "[0-9]{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: numberString)
    }
}
