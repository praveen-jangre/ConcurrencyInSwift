//
//  SwiftConcurrency.swift
//  ConcurrencyInSwift
//
//  Created by Praveen Jangre on 27/06/2025.
//

//Multi-threading using Swift concurrency (async/await)


import Foundation


// Async task 1
func addTwoNumbers(number a: Int, b: Int) async -> Int {
    //print("Addition in thread: \(Thread.current)")
    try? await Task.sleep(nanoseconds: 5_000_000_000) // Thread will sleep for 5 Sec
    return a + b
}

//Async task 2
func multiplyTwoNumbers(number a: Int, b: Int) async -> Int {
    //print("Multiplication in thread: \(Thread.current)")
    try? await Task.sleep(nanoseconds: 10_000_000_000) // Thread will sleep for 10 Sec
    return a * b
}


struct SimulateMath {
    func combineResult() async {
        let sum = await addTwoNumbers(number: 100, b: 200)
        let multi = await multiplyTwoNumbers(number: 4, b: 5)
        
        let combine = await Task.detached {
            //print("Combining result in thread: \(Thread.current)")
            return "Result of Addition is: \(sum) And multiplication is: \(multi)"
        }.value
        
        print(combine)
    }
}

