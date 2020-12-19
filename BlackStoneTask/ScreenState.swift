//
//  ScreenState.swift
//  BlackStoneTask
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation

enum ScreenState<T> {
    case loading
    case success(T)
    case failure(String)
}
