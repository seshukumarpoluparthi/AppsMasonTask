//
//  NetworkManager.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import Foundation

struct NetworkManager {
      func postAction() {
          let Url = String(format: homeUrl)
          guard let serviceUrl = URL(string: Url) else { return }
          let signupDictionary = [
            "name":"Test",
            "email" : "Test@gmail.com",
            "password" : "123456",
            "mobileno":"+918919167655",
            "gender":"male",
            "country":"India"
         ]
         let loginDictionary = [
                 "email" : "Test@gmail.com",
                 "password" : "123456",
                 "deviceType":"IOS",
                 "deviceToken":"134y542jhdm65r"
              ]
         let authDictionary = [
            "deviceType":"IOS",
            "deviceToken":"134y542jhdm65r"
         ]
         let homeDictionary = [
            "status":"1"
         ]
          var request = URLRequest(url: serviceUrl)
          request.httpMethod = "GET"
   //      request.httpMethod = "POST"
          request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
          request.setValue("$2a$10$qPDuMprb1U.gXEP6hWW6wO9PyeqIW6gmNm5BFlhveEGm5ZL.NGH9.", forHTTPHeaderField: "Authorization")
          guard let httpBody = try? JSONSerialization.data(withJSONObject: loginDictionary, options: []) else {
              return
          }
   //       request.httpBody = httpBody

          let session = URLSession.shared
          session.dataTask(with: request) { (data, response, error) in
              if let response = response {
   //               print(response)
              }
              if let data = data {
                  do {
                      let json = try JSONSerialization.jsonObject(with: data, options: [])
                      print(json)
                  } catch {
                      print(error)
                  }
              }
              }.resume()
      }

   }


class Service {
    static let shared = Service() // singleton
   func fetchGenericJSONData<T: Decodable>(urlString: String = "http://3.85.133.207/celeb/register",parameters:[String:Any], completion: @escaping (T?, Error?) -> ()) {
      var request = URLRequest(url: URL(string: urlString)!)
//             request.httpMethod = "GET"
            request.httpMethod = "POST"
             request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
      let accessToken = Defaults.user.authorizedToken
      if accessToken != "" {
           print(accessToken)
         request.setValue("accessToken", forHTTPHeaderField: "Authorization")
      }
           
             guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                 return
             }
             request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
}

