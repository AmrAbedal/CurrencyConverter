//
//  main.swift
//  CodeChallenge
//
//  Created by Amr AbdelWahab on 19/12/2020.
//  Copyright © 2020 BlackStone. All rights reserved.
//

import Foundation
//MARK: - Add arithmetic operators
//2.25 4.50 1.25 5 = 27




//MARK: - Arnagram Problem
extension Array where Element == Character {
    func removeRepeateedCharacters() -> [Character] {
        return self.reduce([Character]()) { (result, character) -> [Character] in
            if !result.contains(character) {
                var result = result
                result.append(character)
                return result
            }
            return result
        }
    }
}
func isAnagrm(string1: String, String2: String) -> Bool {
    var s1 = string1
    var s2 = String2
    s1.removeAll(where: {$0 == " "})
    s2.removeAll(where: {$0 == " "})
    let s5 = s1.sorted().removeRepeateedCharacters()
    let s6 = s2.sorted().removeRepeateedCharacters()
    return s5 == s6
}

print(isAnagrm(string1: "debit card", String2: "bad credit"))
print(isAnagrm(string1: "punishments", String2: "nine thumps"))
