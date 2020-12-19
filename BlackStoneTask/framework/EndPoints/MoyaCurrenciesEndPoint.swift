//
//  MoyaCurrenciesEndPoint.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation
import Moya

extension CurrenciesEndPoint: TargetType {
    var baseURL: URL {
        switch self {
        case .loadCurrencies, .loadCurrenciesRates(_,_):
            return URL(string:Constants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .loadCurrencies:
            return "symbols"
            
        case .loadCurrenciesRates(baseCurrency: _, selcectedSymplos: _):
            return "latest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .loadCurrencies, .loadCurrenciesRates(_,_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .loadCurrencies:
            return .requestParameters(parameters: ["access_key": Constants.secretKey], encoding: URLEncoding.queryString)
        case .loadCurrenciesRates(baseCurrency: let baseCurrency, selcectedSymplos: let selcectedSymplos):
              return .requestParameters(parameters:
                ["access_key": Constants.secretKey,
//                 "base":baseCurrency,
                 "symbols":selcectedSymplos.joined(separator: ",")], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
