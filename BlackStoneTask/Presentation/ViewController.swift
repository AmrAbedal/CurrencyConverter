//
//  ViewController.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import UIKit
import RxSwift
class ViewController: UIViewController {
    private let disposable = DisposeBag()
    let baseCurrencies: [String] = ["USD","AUD","CAD","PLN","MXN"]
    @IBOutlet weak var selectedCurrencyTableView: UITableView!
    @IBOutlet weak var baseCurrencyButton: UIButton!
    private lazy var viewModel = CurrenciesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubscribers()
        // Do any additional setup after loading the view.
        viewModel.laodCurrencies()
    }
    private func setupSubscribers() {
        viewModel.currenciesSubject.subscribe({ [weak self] event in
            if let element = event.element, let state = element {
                self?.handleCurrenciesState(state: state)
            }
            }).disposed(by: disposable)
    }
    private func handleCurrenciesState(state: ScreenState<[String]> ) {
        switch state {
        case .loading: break
        case .success(let currencies): handleSuccess(currencies: currencies)
        case .failure(let error): break
        }
    }
    private func handleSuccess(currencies: [String]) {
        
    }
    @IBAction func baseCurrencyButtonTapped(_ sender: UIButton) {
        
    }
    
}

