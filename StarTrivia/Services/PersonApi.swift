//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 17.06.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import Foundation

class PersonApi {
    
    func getRandomPersonSession() {
        
        guard let url = URL(string: PERSON_URL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                debugPrint()
                return
            }
            
            guard let data  = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                print(json)
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
            
            print("Data = \(data)")
            print("Response = \(response)")
            print("Error = \(error)")
        }
        
        task.resume()
    }
}
