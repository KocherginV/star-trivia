//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 17.06.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi {
    
    // Web request with AF and Codable
    
    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    //    // Web request with AF and SwiftyJson
    //
    //    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
    //        Alamofire.request(url).responseJSON { (response) in
    //            if let error = response.result.error {
    //                debugPrint(error.localizedDescription)
    //                completion(nil)
    //                return
    //            }
    //
    //            guard let data = response.data else { return completion(nil) }
    //            do {
    //                let json = try JSON(data: data)
    //                let person = self.parsePersonSwifty(json: json)
    //                completion(person)
    //            } catch {
    //                debugPrint(error.localizedDescription)
    //                completion(nil)
    //            }
    //        }
    //    }
    
    //Web request with Alamofire:
    
    //    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
    //        Alamofire.request(url).responseJSON { (response) in
    //            if let error = response.result.error {
    //                debugPrint(error.localizedDescription)
    //                completion(nil)
    //                return
    //            }
    //
    //            guard let json = response.result.value as? [String: Any] else {
    //                return completion(nil)
    //            }
    //            let person = self.parsePersonManual(json: json)
    //            completion(person)
    //        }
    //
    //    }
    //
    //Web request with URL Session:
    
    func getRandomPersonSession(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                debugPrint()
                completion(nil)
                return
            }
            
            guard let data  = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                DispatchQueue.main.sync {
                    completion(person)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        
        task.resume()
    }
    
    // parsing with SwiftyJson
    private func parsePersonSwifty(json: JSON) -> Person{
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeWorldUrl = json["homeworld"].stringValue
        let filmUrls = json["films"].arrayValue.map({$0.stringValue})
        let vehicleUrls = json["vehicles"].arrayValue.map({$0.stringValue})
        let starshipUrls = json["starships"].arrayValue.map({$0.stringValue})
        
        return Person (name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeWorldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
    }
    
    // parsing function using manual methods
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
