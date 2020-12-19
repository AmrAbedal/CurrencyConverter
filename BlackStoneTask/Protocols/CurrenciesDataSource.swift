//
//  CurrenciesDataSource.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation
import RxSwift

protocol CurrenciesDataSource  {
    func loadCurrencies() -> Single<CurrenciesResponce>
    func loadCurrenciesRates(base: String, sympols: [String]) -> Single<CurrenciesRateResponse>
}
