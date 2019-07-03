//
//  Starship.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 03.07.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import Foundation

struct Starship: Codable {
    
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let speed: String
    let crew: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
