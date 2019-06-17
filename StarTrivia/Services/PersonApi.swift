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
                self.parsePersonManual(json: json)
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        
        task.resume()
    }
    
    private func parsePersonManual(json: [String: Any]) -> Person{
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeWorldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        return Person (name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeWorldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
    }
}
