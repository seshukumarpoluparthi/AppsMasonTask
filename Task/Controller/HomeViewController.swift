//
//  ViewController.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   override func viewDidLoad() {
    super.viewDidLoad()
   }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
         navigationController?.navigationBar.isHidden = true
      }
}
