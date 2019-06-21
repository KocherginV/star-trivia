//
//  Constants.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 12.06.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor
let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/1"

typealias PersonResponseCompletion = (Person?) -> Void
