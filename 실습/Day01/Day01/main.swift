//
//  main.swift
//  Day01
//
//  Created by mars on 2021/10/09.
//

import Foundation

/*
 값 타입과 참조 타입
 Class
 - 전통적인 OOP관점에서의 Class
 - 단일 상속
 - Method (function)
 - Property (변수 선언)
 - 참조 타입(Call by reference) 값을 같이 사용
 
 Struct
 - 다양한 형태로 사용 가능
 - 상속 불가
 - Method
 - Property
 - 값 타입 (Call by value)
 
 Value vs. Reference
 - Value : Date값을 전달할때 값을 복사하여 전달
 - Reference : Date값을 전달할때 값의 메모리 위치를 전달
 */

// Class, Struct 비교

class ReferenceType{
    var property = 1
}

struct ValueType{
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct : \(firstStructInstance.property)")
print("second struct : \(secondStructInstance.property)")

let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class : \(firstClassReference.property)")
print("second class : \(secondClassReference.property)")

/*
 Data Types in Swift
    public struct Int
    
 */
