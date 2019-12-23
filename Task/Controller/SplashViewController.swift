//
//  SplashViewController.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//       moveToHome()
     
      
      let authDictionary = [
         "deviceType":"IOS",
         "deviceToken":"134y542jhdm65r"
      ]
           Service.shared.fetchGenericJSONData(urlString: API.loginWithAuthUrl, parameters: authDictionary) { (user:UserHead?, error:Error?) in
              if error != nil{
                 showAlert(withMessage: error?.localizedDescription, viewController: self)
                 return
              }
            print(user)
            DispatchQueue.main.async {
               self.moveToLoginVC()
            }
           }
    }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.navigationBar.isHidden = true
   }
   
   func moveToHome(){
      let homeVC = storyboard?.instantiateViewController(identifier: HomeViewController.storyboardID) as! HomeViewController
   navigationController?.pushViewController(homeVC, animated: true)
   }
   
   func moveToLoginVC(){
      let loginVC = storyboard?.instantiateViewController(identifier: LoginViewController.storyboardID) as! LoginViewController
     navigationController?.pushViewController(loginVC, animated: true)
   }
}
