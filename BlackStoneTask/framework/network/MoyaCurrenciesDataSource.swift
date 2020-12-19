//
//  MoyaCurrenciesDataSource.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class MoyaCurrenciesDataSource: CurrenciesDataSource {
    let provider = MoyaProvider<CurrenciesEndPoint>()
    func loadCurrencies() -> Single<CurrenciesResponce> {
      return provider.rx
        .request(.loadCurrencies)
        .map{
            try JSONDecoder().decode(CurrenciesResponce.self, from: $0.data)
        }
    }
}
