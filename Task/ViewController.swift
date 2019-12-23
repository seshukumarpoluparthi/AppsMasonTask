//
//  ViewController.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      
      
      postAction()
   }

   func postAction() {
       let Url = String(format: "http://3.85.133.207/celeb/login")
       guard let serviceUrl = URL(string: Url) else { return }
       let parameterDictionary = [
         "name":"Test",
         "email" : "Test@gmail.com",
         "password" : "123456",
         "mobileno":"+918919167655",
         "gender":"male",
         "country":"India"
      ]
      let parametersDictionary = [
              "email" : "Test@gmail.com",
              "password" : "123456",
              "deviceType":"IOS",
              "deviceToken":"134y542jhdm65r"
           ]
       var request = URLRequest(url: serviceUrl)
       request.httpMethod = "POST"
       request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
       guard let httpBody = try? JSONSerialization.data(withJSONObject: parametersDictionary, options: []) else {
           return
       }
       request.httpBody = httpBody

       let session = URLSession.shared
       session.dataTask(with: request) { (data, response, error) in
           if let response = response {
               print(response)
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

