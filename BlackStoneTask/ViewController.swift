//
//  ViewController.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let baseCurrencies: [String] = ["USD","AUD","CAD","PLN","MXN"]
    @IBOutlet weak var selectedCurrencyTableView: UITableView!
    @IBOutlet weak var baseCurrencyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func baseCurrencyButtonTapped(_ sender: UIButton) {
        
    }
    
}

