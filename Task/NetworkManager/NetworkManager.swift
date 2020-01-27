//
//  NetworkManager.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

class Service {
    static let shared = Service() // singleton
    func fetchGenericJSONData<T: Decodable>(
        urlString: String,
        parameters:[String:Any],
        httpMethod:HTTPMethod = .post,
        completion: @escaping (T?, String) -> ()
    ) {
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = httpMethod.rawValue
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let accessToken = Defaults.getAccessToken
        if accessToken != "" {
            print(accessToken)
            request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        }
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        if httpMethod != .get{
            request.httpBody = httpBody
        }
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            if let err = err {
                completion(nil, err.localizedDescription)
                return
            }
            guard let httpResponse = resp as? HTTPURLResponse else {
                return
            }
            guard httpResponse.statusCode == 200 else{
                print(httpResponse.statusCode)
                if let resp = try! JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? [String:Any]{
                    print(resp)
                    if let error = resp["errors"] as? String{
                        completion(nil, error)
                    }
                }
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                completion(objects, "")
            } catch {
                completion(nil, "")
            }
        }.resume()
    }
}

