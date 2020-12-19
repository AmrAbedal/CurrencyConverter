//
//  CurrencyConverterViewController.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var amoutAfterConvertLabel: UILabel!
    @IBOutlet weak var selectedCurrencyLabel: UILabel!
    @IBOutlet weak var baseCurrencyTextFiled: UITextField!
    //MARK: - paramters
    let baseCurrency: String
    let selectedCurrency: CurrencyRateScreenData
    init( baseCurrency: String,
          selectedCurrency: CurrencyRateScreenData) {
        self.baseCurrency = baseCurrency
        self.selectedCurrency = selectedCurrency
        super.init(nibName:"CurrencyConverterViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    private func initialSetup() {
        baseCurrencyLabel.text = baseCurrency
        selectedCurrencyLabel.text = selectedCurrency.symbol
        baseCurrencyTextFiled.text = "\(1)"
        amoutAfterConvertLabel.text = "\(selectedCurrency.rate)"
    }
    @IBAction func textfieldDidChange(_ sender: UITextField) {
        guard let amount = sender.text,
            let doubleAmount = Double.init(amount) else { return }
        amoutAfterConvertLabel.text = "\(selectedCurrency.rate * doubleAmount)"
    }
}
