//
//  Defaults.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import Foundation

var isUserAlreadyLogin:Bool{
    return !Defaults.user.email.isEmpty ? true : false
}

var userDefaults = UserDefaults.standard


struct Defaults {
    static func saveUser(_ user:User){
        do{
            let user = try JSONEncoder.init().encode(user)
            userDefaults.set(user, forKey: "User")
            userDefaults.synchronize()
        }catch{
            print("Unable to encode user data")
        }
    }

    static var user:User{
        var user = User()
        if let resp = userDefaults.data(forKey: "User"){
            do{
                user = try JSONDecoder.init().decode(User.self, from: resp)
            }catch{
                print("Unable to decode user data")
            }
        }
        return user
    }

    static func removeUserData() {
        userDefaults.removeObject(forKey: "User")
        userDefaults.synchronize()
    }
    
    static func removeAccessToken() {
        userDefaults.removeObject(forKey: "accessToken")
    }
    
    static func saveAccessToken(accessToken:String) {
        userDefaults.set(accessToken, forKey: "accessToken")
    }
    
    static var getAccessToken:String{
        if let token = userDefaults.value(forKey: "accessToken") as? String{
            return token
        }else{
            return ""
        }
    }
    
}
