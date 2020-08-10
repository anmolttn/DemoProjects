//
//  ValidationTesting.swift
//  UnittestingPracticeTests
//
//  Created by TTN on 07/08/20.
//  Copyright © 2020 TTN. All rights reserved.
//

@testable import UnittestingPractice
import XCTest

class ValidationTesting: XCTestCase {

    var sut : Validationfunction?
    
    override func setUp() {
        sut = Validationfunction()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testIsValidName () {
        guard let testCase1 = sut?.isValidName(nameString: "Anmol") else { return }
        XCTAssertEqual(testCase1, true)
        guard let testCase2 = sut?.isValidName(nameString: "Anmol Chauhan") else { return }
        XCTAssertTrue(testCase2)
        guard let testCase3 = sut?.isValidName(nameString: "123") else { return }
        XCTAssertFalse(testCase3)
        guard let testCase4 = sut?.isValidName(nameString: "@£$%") else { return }
        XCTAssertEqual(testCase4, false)
        guard let testCase5 = sut?.isValidName(nameString: "123@123") else { return }
        XCTAssertEqual(testCase5, false)
    }
    
    func testIsValidEmail() {
        guard let testCase1 = sut?.isValidEmailAddress(emailAddressString: "anmol@gmail.com") else { return }
        XCTAssertEqual(testCase1, true)
        guard let testCase2 = sut?.isValidEmailAddress(emailAddressString: "1234@gmail.com") else { return }
        XCTAssertTrue(testCase2)
        guard let testCase3 = sut?.isValidEmailAddress(emailAddressString: "anmol@gmail") else { return }
        XCTAssertFalse(testCase3)
        guard let testCase4 = sut?.isValidEmailAddress(emailAddressString: "anmol@.com") else { return }
        XCTAssertEqual(testCase4, false)
        guard let testCase5 = sut?.isValidEmailAddress(emailAddressString: "@gmail.com") else { return }
        XCTAssertEqual(testCase5, false)
    }
    
    func testIsValidMarks(){
        guard let testCase1 = sut?.isValidMarks(marksStirng: "88") else { return }
        XCTAssertEqual(testCase1, true)
        guard let testCase2 = sut?.isValidMarks(marksStirng: "77") else { return }
        XCTAssertEqual(testCase2, true)
        guard let testCase3 = sut?.isValidMarks(marksStirng: "9") else { return }
        XCTAssertEqual(testCase3, false)
        guard let testCase4 = sut?.isValidMarks(marksStirng: "999") else { return }
        XCTAssertFalse(testCase4)
        guard let testCase5 = sut?.isValidMarks(marksStirng: "qwe") else { return }
        XCTAssertEqual(testCase5, false)
        guard let testCase6 = sut?.isValidMarks(marksStirng: "q2") else { return }
        XCTAssertEqual(testCase6, false)
        guard let testCase7 = sut?.isValidMarks(marksStirng: "9z") else { return }
        XCTAssertEqual(testCase7, false)
    }
    
    func testIsValidPhonenumber() {
        guard let testCase1 = sut?.isValidNumber(numberString: "0987654321") else { return }
        XCTAssertEqual(testCase1, true)
        guard let testCase2 = sut?.isValidNumber(numberString: "9988776655") else { return }
        XCTAssertEqual(testCase2, true)
        guard let testCase3 = sut?.isValidNumber(numberString: "123456789") else { return }
        XCTAssertEqual(testCase3, false)
        guard let testCase4 = sut?.isValidNumber(numberString: "123456asdf") else { return }
        XCTAssertEqual(testCase4, false)
        guard let testCase5 = sut?.isValidNumber(numberString: "asdfghjklp") else { return }
        XCTAssertEqual(testCase5, false)
        guard let testCase6 = sut?.isValidNumber(numberString: "123asd1234") else { return }
        XCTAssertEqual(testCase6, false)
    }
    
    

}
