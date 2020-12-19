//
//  CurrenciesViewModel.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation
import RxSwift

class CurrenciesViewModel {
    private let disposable = DisposeBag()
    let currenciesSubject = BehaviorSubject<ScreenState<[String]>?>(value: nil)
    private let dataSource: CurrenciesDataSource
    private let currenciesUseCase: CurrenciesUseCase
    init(dataSource: CurrenciesDataSource = MoyaCurrenciesDataSource(),
        currenciesUseCase: CurrenciesUseCase = DefaultCurrenciesUseCase()) {
        self.dataSource = dataSource
        self.currenciesUseCase = currenciesUseCase
    }
    func laodCurrencies() {
        currenciesUseCase.loadCurrenciesUsecase(dataSource: dataSource).subscribe(onSuccess: {
            result in
            self.currenciesSubject.onNext(result)
        }, onError: {error in
            self.currenciesSubject.onNext(.failure(error.localizedDescription))
        }).disposed(by: disposable)
    }
    
}
