//
//  CurrenciesUseCase.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation
import RxSwift

protocol CurrenciesUseCase {
    func loadCurrenciesUsecase(dataSource: CurrenciesDataSource) -> Single<ScreenState<[String]>>
}

