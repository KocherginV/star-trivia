//
//  ViewController.swift
//  StarTrivia
//
//  Created by Volodymyr Kochergin on 06.06.19.
//  Copyright © 2019 Volodymyr Kochergin. All rights reserved.
//

import UIKit

class SelectPersonViewController: UIViewController {

    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personApi.getRandomPersonSession()
    }


}

