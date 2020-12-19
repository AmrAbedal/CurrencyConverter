//
//  CurrencyRateScreenData.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation

struct CurrencyRatesScreenData {
    let base: String
    let currencies: [CurrencyRateScreenData]
}

struct CurrencyRateScreenData {
    let symbol: String
    let rate: Double
}
