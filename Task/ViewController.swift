//
//  ViewController.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

//{
//    data =     {
//        authorizedToken = "$2a$10$OKYJcHK3Fp0bqOpL7y6LwuUrPCdJxUAOzneIXpCzuDAfTSuw1yXQe";
//        country = India;
//        deviceToken = 134y542jhdm65r;
//        deviceType = IOS;
//        email = "Test@gmail.com";
//        gender = male;
//        lastLogin = "2019-12-23T07:18:21.816Z";
//        mobile = "+918919167655";
//        name = Test;
//        twitterID = "<null>";
//    };
//    status = 200;
//}

let loginWithAuthUrl = "http://3.85.133.207/celeb/loginwithAuth"
let loginUrl = "http://3.85.133.207/celeb/login"
let signupUrl = "http://3.85.133.207/celeb/register"
let homeUrl = "http://3.85.133.207/celeb/viewRequests?status=1"

class ViewController: UIViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      
      
      postAction()
   }

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
       request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
       request.setValue("$2a$10$OKYJcHK3Fp0bqOpL7y6LwuUrPCdJxUAOzneIXpCzuDAfTSuw1yXQe", forHTTPHeaderField: "Authorization")
       guard let httpBody = try? JSONSerialization.data(withJSONObject: homeDictionary, options: []) else {
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
    
    func fetchGenericJSONData<T: Decodable>(urlString: String = "http://3.85.133.207/celeb/register", completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
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

