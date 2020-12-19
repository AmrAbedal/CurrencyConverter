//
//  CurrenciesEndPoint.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation

enum CurrenciesEndPoint {
    case loadCurrencies
    case loadCurrenciesRates(baseCurrency: String,selcectedSymplos: [String])
}
