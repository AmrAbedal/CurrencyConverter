//
//  ViewController.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import UIKit
import RxSwift
import DropDown

class ViewController: UIViewController {
    private let disposable = DisposeBag()
    private var baseCurrencies: [String] = []
    @IBOutlet weak var selectedCurrencyTableView: UITableView!
    @IBOutlet weak var baseCurrencyButton: UIButton!
    private let dropDown = DropDown()
    private lazy var currenciesRatesTableViewDataSource = CurrenciesRatesTableViewDataSource(selectItemAction: { [weak self] currency in
        self?.openCurrencyChangeDialog(currency: currency)
    })
    private func openCurrencyChangeDialog(currency: CurrencyRateScreenData) {
        
    }
    private lazy var viewModel = CurrenciesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRatesTableView()
        setupBaseCurrencyDropDown()
        setupSubscribers()
        // Do any additional setup after loading the view.
        viewModel.laodCurrencies()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dropDown.anchorView = baseCurrencyButton // UIView or UIBarButtonItem
    }
    private func setupRatesTableView() {
        selectedCurrencyTableView.dataSource = currenciesRatesTableViewDataSource
    }
    private func setupBaseCurrencyDropDown() {
        let dropDown = DropDown()
        // Action triggered on selection
        dropDown.width = 200
        dropDown.direction = .top
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.didSelectCurrency(base: item)
        }
    }
    private func setupSubscribers() {
        viewModel.currenciesSubject
            .subscribe({ [weak self] event in
                if let element = event.element, let state = element {
                    self?.handleCurrenciesState(state: state)
                }
            }).disposed(by: disposable)
        
        viewModel.currencyRatesSubject
            .subscribe({ [weak self] event in
                if let element = event.element, let state = element {
                    self?.handleCurrenciesRateState(state: state)
                }
            }).disposed(by: disposable)
    }
    private func handleCurrenciesState(state: ScreenState<[String]> ) {
        switch state {
        case .loading: break
        case .success(let currencies): handleSuccess(currencies: currencies)
        case .failure(_): break
        }
    }
    private func handleCurrenciesRateState(state: ScreenState<[CurrencyRateScreenData]> ) {
        switch state {
        case .loading: break
        case .success(let rates): handleCurrenciesRates(rates: rates)
        case .failure(_): break
        }
    }
    private func handleSuccess(currencies: [String]) {
        self.baseCurrencies = currencies
        dropDown.dataSource = currencies
        baseCurrencyButton.setTitle(currencies.first ?? "Select Currency", for: .normal)
        guard let base = self.baseCurrencies.first else {
            return
        }
        didSelectCurrency(base: base)
    }
    private func didSelectCurrency(base: String) {
        viewModel.loadCurrencyRates(base: base, symbols: baseCurrencies.filter({$0 != base}))
    }
    private func handleCurrenciesRates(rates: [CurrencyRateScreenData]) {
        currenciesRatesTableViewDataSource.items = rates
        selectedCurrencyTableView.reloadData()
    }
    @IBAction func baseCurrencyButtonTapped(_ sender: UIButton) {
        dropDown.show()
    }
    
}

