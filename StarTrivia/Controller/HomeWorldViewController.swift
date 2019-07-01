//
//  HomeWorldViewController.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 27.06.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import UIKit

class HomeWorldViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var person: Person!
    let api = HomeworldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeworl(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setupUi(homeworld: homeworld)
            }
        }
    }
    
    func setupUi(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
    
}
