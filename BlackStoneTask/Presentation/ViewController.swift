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
    let baseCurrencies: [String] = []
    @IBOutlet weak var selectedCurrencyTableView: UITableView!
    @IBOutlet weak var baseCurrencyButton: UIButton!
    private let dropDown = DropDown()
    private lazy var viewModel = CurrenciesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseCurrencyDropDown()
        setupSubscribers()
        // Do any additional setup after loading the view.
        viewModel.laodCurrencies()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dropDown.anchorView = baseCurrencyButton // UIView or UIBarButtonItem

    }
    private func setupBaseCurrencyDropDown() {
        let dropDown = DropDown()
        // Action triggered on selection
        dropDown.width = 200
        dropDown.direction = .top
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
        }
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
        case .failure(_): break
        }
    }
    private func handleSuccess(currencies: [String]) {
        dropDown.dataSource = currencies
    }
    @IBAction func baseCurrencyButtonTapped(_ sender: UIButton) {
        dropDown.show()
    }
    
}

