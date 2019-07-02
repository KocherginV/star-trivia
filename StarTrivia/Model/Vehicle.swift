//
//  Vehicle.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 02.07.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import Foundation

struct Vehicle : Codable {
    
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    
    
    enum codingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
