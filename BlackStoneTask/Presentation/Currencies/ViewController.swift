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
    private var selectedValueIndex: Int?
    private var baseCurrencies: [String] = []
    @IBOutlet weak var selectedCurrencyTableView: UITableView!
    @IBOutlet weak var baseCurrencyButton: UIButton!
    private let dropDown = DropDown()
    private lazy var currenciesRatesTableViewDataSource = CurrenciesRatesTableViewDataSource(selectItemAction: { [weak self] currency in
        self?.openCurrencyChangeDialog(currency: currency)
    })
    private func openCurrencyChangeDialog(currency: CurrencyRateScreenData) {
        guard let baseCurrency = self.baseCurrencies[safe: selectedValueIndex] else {
            return
        }
        let currencyConverterViewController = CurrencyConverterViewController(baseCurrency: baseCurrency, selectedCurrency: currency)
        self.present(currencyConverterViewController, animated: true, completion: nil)
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dropDown.anchorView = baseCurrencyButton // UIView or UIBarButtonItem
    }
    private func setupRatesTableView() {
        selectedCurrencyTableView.dataSource = currenciesRatesTableViewDataSource
        selectedCurrencyTableView.delegate = currenciesRatesTableViewDataSource
    }
    private func setupBaseCurrencyDropDown() {
        dropDown.width = 200
        dropDown.direction = .bottom
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.didSelectCurrency(index: index)
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
    private func handleCurrenciesRateState(state: ScreenState<CurrencyRatesScreenData> ) {
        switch state {
        case .loading: break
        case .success(let rates): handleCurrenciesRates(rates: rates)
        case .failure(_): break
        }
    }
    private func handleSuccess(currencies: [String]) {
        self.baseCurrencies = currencies
        dropDown.dataSource = currencies
        didSelectCurrency(index: 0)
    }
    private func didSelectCurrency(index: Int) {
        guard let base = self.baseCurrencies[safe: index] else {
            return
        }
        viewModel.loadCurrencyRates(base: base, symbols: baseCurrencies.filter({$0 != base}))
    }
    private func handleCurrenciesRates(rates: CurrencyRatesScreenData) {
        selectedValueIndex = self.baseCurrencies.firstIndex(where: {$0 == rates.base})
        baseCurrencyButton.setTitle(rates.base , for: .normal)
        currenciesRatesTableViewDataSource.items = rates.currencies
        selectedCurrencyTableView.reloadData()
    }
    @IBAction func baseCurrencyButtonTapped(_ sender: UIButton) {
        dropDown.show()
    }
}

