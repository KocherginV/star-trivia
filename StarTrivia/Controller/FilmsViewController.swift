//
//  FilmsViewController.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 27.06.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import UIKit

class FilmsViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var crawlLbl: UITextView!
    
    var person: Person!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func previousClicked(_ sender: Any) {
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        setButtonState()
    }
    
    func setButtonState() {
        
    }
}
