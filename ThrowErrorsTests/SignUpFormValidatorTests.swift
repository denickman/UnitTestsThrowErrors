//
//  SignUpFormValidatorTests.swift
//  ThrowErrorsTests
//
//  Created by Denis Yaremenko on 3/30/21.
//

import XCTest
@testable import ThrowErrors

class SignUpFormValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError() {
        let sut = SignUpFormValidator()
        
        // First Throw Method
        
        XCTAssertThrowsError(try sut.isFirstNameValid("Jonh*"), "The isFirstNameValid() should have thrown an error if user`s first name contains illegal characters") { (errorThrown) in
            XCTAssertEqual(errorThrown as? SignUpError, SignUpError.illegalCharactersFound)
        }

        // Do Try Catch method
        do {
            let _ = try sut.isFirstNameValid("John#")
            XCTFail("isFirstNameValid() was supposed to throw an error when illegal characters used in users first name")
        } catch SignUpError.illegalCharactersFound {
            // Successfully passed
            return
        } catch {
            XCTFail("isFirstNameValid() was supposed to throw the SignUpError.illegalCharactersFound error when illegal characters used. A different Error was thrown.")
            return
        }
    }
    
    func testFirstNameValidation_WhenValidCharactersProvided_ThrowsNoErrors() {
        let sut = SignUpFormValidator()
        
        // First Method
//        XCTAssertNoThrow(try sut.isFirstNameValid("John"), "The isFirstNameValid() should not have thrown an error when there are no illgegal characters")
//        XCTAssertThrowsError(try sut.isFirstNameValid("John*"))
        
        // Second Method via do try catch
        do {
        let _ = try sut.isFirstNameValid("Jonh")
        } catch {
            XCTFail("isFirstNameValid() was not supposed to throw an error when a first name value was provided")
        }
    }
}
