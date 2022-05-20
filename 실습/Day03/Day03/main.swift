//
//  main.swift
//  Day03
//
//  Created by mars on 2021/10/16.
//

import Foundation

// Closure
// 함수와 기능이 동일하나 이름이 없는 함수
// 해당 변수에 함수의 기능을 할당

// Closure와 함수의 비교

// 함수
func sumFunction(num1:Int, num2:Int) -> Int{
    return (num1 + num2)
}

var sumResult: Int = sumFunction(num1: 10, num2: 20)
print(sumResult)

// closure alert에만 거의 사용
var sumClosure: (Int, Int) -> Int = {(num1:Int, num2:Int) -> Int in
    return (num1 + num2)
}

sumResult = sumClosure(10,20)
print(sumResult)

print(Int.random(in: 1..<10))
