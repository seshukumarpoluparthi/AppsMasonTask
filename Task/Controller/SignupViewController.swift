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
      let signupDictionary = [
         "name":"Test",
         "email" : "Test7@gmail.com",
         "password" : "123456",
         "mobileno":"+918919167655",
         "gender":"male",
         "country":"India"
      ]
           Service.shared.fetchGenericJSONData(urlString: API.signupUrl, parameters: signupDictionary) { (user:SignupHead?, error:Error?) in
              if error != nil{
                 showAlert(withMessage: error?.localizedDescription, viewController: self)
                 return
              }
            print(user)
            DispatchQueue.main.async {
               self.moveToLoginVC()
            }
           }
//      switch validateSignupCredentials {
//      case .valid:
//         moveToHomeVC()
//      case .invalid(let error):
//         showAlert(withMessage: error, viewController: self)
//      }
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
