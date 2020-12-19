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

let value = ((2.25 + 4.50) - (1.25)) * 5
print(value)
// the best result I have git is 27.5

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

//MARK: - QUESTIONS
let questsions =
"""
 • What 3rd party libraries did you use and why ?
:- Moya/RxSwift for networking, I'm using the reactive version of Moya with RXSwift, as I'm using MVVM architecture pattern

• What architecture did you use and why ?
:- MVVM, I prefere using MVVM Architecture in small tasks, or we can say in bit small apps that we don't want to overEngineer, regarding this task, I have to choose between MVP, or MVVM, I prefere MVVM over MVP, MVVM is the reactive version of MVP .

• Let’s say that your team is working on this app and you're looking to add a new
feature. Describe the process that you would follow in your current place of work
to bring this from an initial idea to a live feature in production. What are the
positives and negatives of this approach?

: -

1 - from my point of view I think I have to explain what the purpose of this feature at first, and why we need to add this feature to our app.
2 - ask them about any feedback about is that valid or not and why from different aspects even its technical or its a business.
3 - try to spread it to collect a more feedbacks, to help us to validate the idea.
4 - then if it valid and also will help our business to grow, we will put it in our backlog

positives
 sharing Ideas

negatives
we are a Startup.our backlog is full, So it take time to be live in production
"""
