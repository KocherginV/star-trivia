//
//  StarshipsViewController.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 27.06.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import UIKit

class StarshipsViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let api = StarshipApi()
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = starships.count > 1
        guard let firstStarship = starships.first else { return }
        getStarship(url: firstStarship)
        
    }
    
    func getStarship(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        manufacturerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        
        getStarship(url: starships[currentStarship])
    }
    
}
