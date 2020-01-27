//
//  SignupViewController.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mobileNoTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signupBtnTapped(_ sender: Any) {
        switch validateSignupCredentials {
        case .valid:
            signupUser()
        case .invalid(let error):
            showAlert(withMessage: error, viewController: self)
        }
    }
    
    func signupUser(){
        self.startActivityIndicator()
        let signupDictionary = [
            "name":nameTextField.text!,
            "email" : emailTextField.text!,
            "password" : passwordTextField.text!,
            "mobileno":mobileNoTextField.text!,
            "gender":genderTextField.text!,
            "country":countryTextField.text!
        ]
        Service.shared.fetchGenericJSONData(urlString: API.signupUrl, parameters: signupDictionary) { (response:SignupHead?, error) in
            if error != ""{
                DispatchQueue.main.async {
                    self.stopActivityIndicator()
                    showAlert(withMessage: error, viewController: self)
                }
                return
            }
            DispatchQueue.main.async {
                self.stopActivityIndicator()
                self.moveToLoginVC()
            }
        }
    }
    
    func moveToLoginVC(){
        let loginVC = storyboard?.instantiateViewController(identifier: LoginViewController.storyboardID) as! LoginViewController
        navigationController?.pushViewController(loginVC, animated: true)
    }
}

//MARK: - Validation
extension SignupViewController {
    var validateSignupCredentials:UserValidationState {
        if nameTextField.text.isBlank {
            return .invalid(ATErrorMessage.Name.empty)
        }else if emailTextField.text.isBlank {
            return .invalid(ATErrorMessage.Email.emptyNew)
        }else if passwordTextField.text.isBlank {
            return .invalid(ATErrorMessage.Password.newEmpty)
        }else if mobileNoTextField.text.isBlank {
            return .invalid(ATErrorMessage.Phone.empty)
        }else if genderTextField.text.isBlank {
            return .invalid(ATErrorMessage.Gender.empty)
        }else if countryTextField.text.isBlank {
            return .invalid(ATErrorMessage.Country.empty)
        }
        return .valid
    }
}
