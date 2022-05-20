//
//  main.swift
//  Day02
//
//  Created by mars on 2021/10/10.
//

import Foundation

// 구조체
// : 구조체는 Swift에서 Type을 정의한다.

// Property & Method
struct Sample{
    // Property (Field)
    var sampleProperty: Int = 10 // 가변 프로퍼티
    let fiexedSampleProperty: Int = 100 // 불변 프로퍼티
    static var typeProperty: Int = 1000 // 타입 프로퍼티, 클래스의 데이터 값을 공유해서 쓰고 싶을 때(인스턴스를 만들지 않고)
    
    // Method (function)
    func instanceMethod(){ // Instance Method
        print("instance method")
    }
    
    static func typeMethod(){
        print("type method")
    }
}

// 구조체 사용 타입으로 사용해서
var samp : Sample = Sample() // 기본 생성자는 알아서 만들어짐
print(samp.sampleProperty)
samp.sampleProperty = 100 // struct의 값이 바뀐건 아님
print(samp.sampleProperty)
//samp.fiexedSampleProperty = 10 //let으로 선언되어 있어 value 변경 불가

var samp1: Sample = Sample()
print(samp1.sampleProperty)
samp1.instanceMethod()

// 타입 프로퍼티 및 메서드 static은 구조체에서 바로 갖다쓰는 방식, instance를 만들지 않음
Sample.typeProperty = 300
Sample.typeMethod()

// 학생 구조체
struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce(){
        print("저는 \(self.class)반 \(name) 입니다.")
    }
}

// 타입 메서드 사용
Student.selfIntroduce()
// Instance 생성
var student:Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

// Instance 생성
let cathy: Student = Student()
//cathy.name = "Cathy" // let선언으로 property값 변경 불가
cathy.selfIntroduce()

// 클래스
// 구조체는 값 타입인 반면 클래스는 참조 타입

class SampleC{
    var sampProperty: Int = 10
    let fixedSampProperty: Int = 100
    static var typeProperty: Int = 1000
    
    func instanceMethod() {
        print("instance method")
    }
    
    static func typeMethod(){
        print("type method")
    }
}

// Instance 생성
var sampC: SampleC = SampleC()

// Class와 Structure
// : 클래스와 구조체는 프로그램 코드를 조직화 하기 위해 사용
// : OOP를 위한 필요 요소

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()
someVideoMode.resolution.width = 1280

// 구조체형의 초기화
let vga = Resolution(width: 640, height: 480)
var cinema = vga
print("cinema is now \(cinema.width) pixels wide")

// 시험 점수 총점 및 평균 출력
// 이름, 점수1, 점수2, 점수3, ...

class Exam{
    var name:String = ""
    var jum:[Int] = []
    var tot = 0, avg = 0
    
    func input(_ nn : String, _ jj : Int...){
        name = nn
        jum = jj
        calc()
        result()
    }
    
    func calc(){
        tot = 0
        for i in jum {
            tot += i
        }
        avg = tot/jum.count
    }
    
    func result(){
        print(name,jum,tot,avg)
    }
}
let st1: Exam = Exam()
let st2 = Exam()

st1.input("유비", 77,78,71)
st2.input("장비", 80,90)

// 도형 Class : 면적과 둘레
// 원 : _.input(5)
// 직사각형 : _.input(5,6)
// 직각삼각형 : _.input(5,6,8)
// function 이름은 동일하고 parameter갯수를 틀리게 구성 : Overloading

class Shape{
    var kind = ""
    var area = 0.0
    var border = 0.0
    
    func input(_ r: Double){
        kind = "원"
        let pi = 3.14157
        area = pi * r * r
        border = r * pi * 2
        result()
    }
    
    func input(_ w: Double, _ h: Double){
        kind =  "직사각형"
        area = w * h
        border = Double(2 * Int(w+h))
        result()
    }
    
    func input(_ w: Double, _ h: Double, _ l: Double){
        kind = "직각삼각형"
        area = w * h
        border = w + h + l
        result()
    }
    
    func result(){
        print("\(kind) : \(Int(area)) , \(Int(border))")
    }
}

let sh1 : Shape = Shape()
sh1.input(5)
sh1.input(4, 3)
sh1.input(2, 5, 4)

// Class 생성자
class Shape1{
    var area = 0.0
    let pi = 3.14
    
    init(){ // 생성자
        print("계산시작!")
    }
    
    init(radius: Double){
        input(radius)
    }
    
    func input(_ r: Double){
        area = pi * r * r
        result()
    }
    
    func result(){
        print("원의 면적은 \(Int(area))  입니다.")
    }
}

let sh4: Shape1 = Shape1()
sh4.input(5)

let sh5: Shape1 = Shape1(radius: 5.0) // 생성자를 통한 방법

//
class Shape2 {
    var name:String = ""
    var area:Double = 0.0
    var border:Double = 0.0
    let pi = 3.14
    
    init(_ r:Double){
        name = "원"
        area = r * r * pi
        border = 2 * r * pi
    }
    init(_ w:Double,_ h:Double){
        name = "직사각형"
        area = w * h
        border = (w + h) * 2
    }
    init(_ w:Double,_ h:Double, _ l:Double){
        area = (w * h) / 2
        border = w+h+l
    }
    func result(){
        print("\(name) ")
    }
}

let sh6: Shape2 = Shape2(5)
let sh7: Shape2 = Shape2(5,6)
let sh8: Shape2 = Shape2(5,6,8)

// Extension
// : 구조체, 클래스 타입에 새로운 기능을 추가할 수 있는 기능.

// Int에 extension으로 property를 추가

extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isEven)
print(1.isOdd)

var num: Int = 3
print(num.isEven)

