//
//  Array+Extension.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: UInt) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
    subscript (safe index: Int) -> Element? {
        return index < count && index >= 0 ? self[index] : nil
    }
    subscript (safe index: Int?) -> Element? {
        if let index = index {
            return index < count && index >= 0 ? self[index] : nil
            
        }
        else {
            return nil
        }
    }
}
