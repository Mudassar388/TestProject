//
//  ApiService.swift
//  TestProject
//
//  Created by Developer on 11/10/2023.
//

import Foundation

struct APIResult {
    let data: Data?
    let response: URLResponse?
    let error: Error?
}

class apiService {
    
    static let shared = apiService()
    
    func makeAPICall(httpMethod: String, baseURL: String, endpoint: String, requestData: Data? = nil, completion: @escaping (APIResult) -> Void) {
        AllLoaders.shared.showCustomLoader()
        
        let fullURLString = baseURL + endpoint
        if let fullURL = URL(string: fullURLString) {
            var request = URLRequest(url: fullURL, timeoutInterval: 60.0)
            request.httpMethod = httpMethod
            
            if httpMethod == "POST" {
                request.httpBody = requestData
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                AllLoaders.shared.hideCustomLoader()
                let result = APIResult(data: data, response: response, error: error)
                completion(result)
            }
            
            task.resume()
        } else {
            AllLoaders.shared.hideCustomLoader()
            let result = APIResult(data: nil, response: nil, error: NSError(domain: "", code: -1, userInfo: nil))
            completion(result)
        }
    }
}
