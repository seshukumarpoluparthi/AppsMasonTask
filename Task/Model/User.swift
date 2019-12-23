//
//  User.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import Foundation

struct SignupHead:Codable {
   var data:String?
   var status:Int?
}

struct UserHead:Codable {
   var data:User?
   var status:Int?
}

struct User:Codable {
   var authorizedToken = ""
   var country = ""
   var deviceToken = ""
   var email = ""
   var gender = ""
   var lastLogin = ""
   var mobile = ""
   var name = ""
   var twitterID:String?
}
