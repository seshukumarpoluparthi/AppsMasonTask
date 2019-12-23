//
//  UITableViewCell.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

extension UITableViewCell{
   static var reuseID:String{
      return String(describing: self)
   }
}
