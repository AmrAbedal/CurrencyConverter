//
//  CurrenciesResponce.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation

struct CurrenciesResponce: Codable {
    let success: Bool
    let symbols: [String:String]
}
