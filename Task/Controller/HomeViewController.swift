//
//  ViewController.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
   override func viewDidLoad() {
    super.viewDidLoad()
    
    
   }
    
    func setupUI(){
        tableView.tableFooterView = .init()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
         navigationController?.navigationBar.isHidden = true
      }
}

extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseID, for: indexPath) as! HomeTableViewCell
        return cell
    }
}

extension HomeViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

