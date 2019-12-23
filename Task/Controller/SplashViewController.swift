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
        let accessToken = Defaults.user.authorizedToken
        if accessToken != "" {
            print(accessToken)
            setupUI()
        }else{
            moveToLoginVC()
        }
    }
    
    
    func setupUI(){
        let authDictionary = [
            "deviceType":"IOS",
            "deviceToken":"134y542jhdm65r"
        ]
        Service.shared.fetchGenericJSONData(urlString: API.loginWithAuthUrl, parameters: authDictionary) { (user:UserHead?, error) in
            if error != ""{
                showAlert(withMessage: error, viewController: self)
                return
            }
            print(user)
            DispatchQueue.main.async {
                self.moveToHome()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func moveToHome(){
        Defaults.removeUserData()
        let homeVC = storyboard?.instantiateViewController(identifier: HomeViewController.storyboardID) as! HomeViewController
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func moveToLoginVC(){
        let loginVC = storyboard?.instantiateViewController(identifier: LoginViewController.storyboardID) as! LoginViewController
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
