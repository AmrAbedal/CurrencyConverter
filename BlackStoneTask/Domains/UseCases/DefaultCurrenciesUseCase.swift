//
//  DefaultCurrenciesUseCase.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation
import RxSwift

class DefaultCurrenciesUseCase: CurrenciesUseCase {
    
    func loadCurrenciesUsecase(dataSource: CurrenciesDataSource) -> Single<ScreenState<[String]>> {
        return dataSource.loadCurrencies().map {
            if $0.success {
                return .success($0.symbols.map({$0.key}))
            } else {
                return .failure("error in fetching currencies from Server")
            }
        }
    }
    
    func loadCurrenciesRates(dataSource: CurrenciesDataSource,base: String, sympols: [String]) -> Single<ScreenState<[CurrencyRateScreenData]>> {
        return dataSource.loadCurrenciesRates(base: base, sympols: sympols).map {
            if $0.success {
                return .success($0.rates.map({CurrencyRateScreenData(symbol:$0.key,rate:$0.value)}))
            } else {
                return .failure("error in fetching currencies rates from Server")
            }
        }
    }
}
