//
//  LoginViewController.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
   
   @IBOutlet weak var emailTextField: UITextField!
   @IBOutlet weak var passwordTextField: UITextField!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       self.navigationItem.hidesBackButton = true
      navigationController?.navigationBar.isHidden = false
   }
   
   @IBAction func signInBtnTapped(_ sender: Any) {
      let loginDictionary = [
         "email" : "Test@gmail.com",
         "password" : "123456",
         "deviceType":"IOS",
         "deviceToken":"134y542jhdm65r"
      ]
      Service.shared.fetchGenericJSONData(urlString: API.loginUrl, parameters: loginDictionary) { (user:UserHead?, error:Error?) in
         if error != nil{
            showAlert(withMessage: error?.localizedDescription, viewController: self)
            return
         }
         print(user?.data?.email)
         if let user = user{
            if let userData = user.data{
            Defaults.saveUser(userData)
            }
         }
      }
      
      
      
//      switch validateSignupCredentials {
//      case .valid:
//         moveToHomeVC()
//      case .invalid(let error):
//         showAlert(withMessage: error, viewController: self)
//      }
   }
   
   @IBAction func signupBtnTapped(_ sender: UIButton) {
      moveToSignupVC()
   }
   
   func moveToSignupVC(){
      let signupVC = storyboard?.instantiateViewController(identifier: SignupViewController.storyboardID) as! SignupViewController
      navigationController?.pushViewController(signupVC, animated: true)
   }
   
   func moveToHomeVC(){
      let homeVC = storyboard?.instantiateViewController(identifier: HomeViewController.storyboardID) as! HomeViewController
      navigationController?.pushViewController(homeVC, animated: true)
   }
   
}

//MARK: - Validation
extension LoginViewController {
   var validateSignupCredentials:UserValidationState {
      if emailTextField.text.isBlank {
         return .invalid(ATErrorMessage.Email.empty)
      }else if passwordTextField.text.isBlank {
         return .invalid(ATErrorMessage.Password.newEmpty)
      }
      return .valid
   }
}