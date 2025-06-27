//
//  GCDConcurrency.swift
//  ConcurrencyInSwift
//
//  Created by Praveen Jangre on 27/06/2025.
//

import Foundation

func divide(number firstNumber: Float, secondNumber: Float ) -> Float {
    print("Task 1  \(Thread.current)")
    return firstNumber / secondNumber
}

func substract(number firstNumber: Int, secondNumber: Int ) -> String {
    print("Task 2  \(Thread.current)")
    if firstNumber < secondNumber {
        let subs = secondNumber - firstNumber
        return "-\(subs)"
    } else {
        let subs = firstNumber - secondNumber
        return "\(subs)"
    }
}


func implementGCD() {
    
    var quotient: Float = 0.0
    var subs: String = ""
    let queueA = DispatchQueue(label: "Q-A")
    let queueB = DispatchQueue(label: "Q-B")
    let group = DispatchGroup()
    
    group.enter()
    queueA.sync {
        quotient = divide(number: 4000, secondNumber: 20)
        print("Result of division is: \(quotient)")
        Thread.sleep(forTimeInterval: 1)
        group.leave()
    }
    
    group.enter()
    queueB.async {
        subs = substract(number: 500, secondNumber: 23)
        print("Result of substraction is: \(subs)")
        Thread.sleep(forTimeInterval: 5)
        group.leave()
    }
    
    group.notify(queue: DispatchQueue.global()) {
        print("Result of division is: \(quotient) And substraction is: \(subs)")
        let sum = Int(quotient) + (Int(subs) ?? 0)
        print("Sum of quotient and subs is \(sum)")
    }
    dispatchMain()
}
