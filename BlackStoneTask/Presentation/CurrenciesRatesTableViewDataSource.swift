//
//  CurrenciesRatesTableViewDataSource.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation
import UIKit

class CurrenciesRatesTableViewDataSource: NSObject, UITableViewDataSource {
     private let selectItemAction: (CurrencyRateScreenData)->()
    init(selectItemAction: @escaping (CurrencyRateScreenData)->()) {
        self.selectItemAction = selectItemAction
    }
    var items: [CurrencyRateScreenData] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = items[indexPath.row].symbol
        return cell
    }
}

extension CurrenciesRatesTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectItemAction(items[indexPath.row])
    }
}
