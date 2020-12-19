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
    func removeRepeatedCharacters() -> [Character] {
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
    let s5 = s1.sorted().removeRepeatedCharacters()
    let s6 = s2.sorted().removeRepeatedCharacters()
    return s5 == s6
}

print(isAnagrm(string1: "debit card", String2: "bad credit"))
print(isAnagrm(string1: "punishments", String2: "nine thumps"))

//MARK: -Fibonacci number
//Using recursion
func recursionFibonacci(number: Int) -> Int {
    if number <= 1 { return number }
    return recursionFibonacci(number: number - 1) + recursionFibonacci(number: number - 2)
}
print(recursionFibonacci(number: 9))
// dynamicFibonacci
func dynamicFibonacci(number: Int) -> Int {
    var fib0 = 0
    var fib1 = 1
  
    if number == 0 { return  fib0}
    if number == 1 {return fib1 }
    for _ in 2...number {
       let fib = fib0 + fib1
       fib0 = fib1
       fib1 = fib
    }
    return fib1
}
print(dynamicFibonacci(number: 9))
