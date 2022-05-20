//
//  ViewController.swift
//  Quiz1
//
//  Created by mars on 2021/10/09.
//

import UIKit

// 상속
class ViewController: UIViewController {
    
    // 입력 받는 부분 optional type
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
        
    // 결과 값 주는 부분
    @IBOutlet weak var tfAddition: UITextField!
    @IBOutlet weak var tfSubtraction: UITextField!
    @IBOutlet weak var tfMultiply: UITextField!
    @IBOutlet weak var tfDivisionQuotient: UITextField!
    @IBOutlet weak var tfDivisionRemainder: UITextField!

    // message
    @IBOutlet weak var tfMessage: UILabel!
    
    // 화면이 구성되기전에 실행되는 펑션들
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 결과값 read-only로 Property 변경
        readOnly()
    }
    
    @IBAction func btnCalc(_ sender: UIButton) {
        guard let strNum1 = tfNum1.text else { return }
        guard let strNum2 = tfNum2.text else { return }
        
        let num1 = Int(strNum1)
        let num2 = Int(strNum2)
        
        calculation(num1!, num2!)
    }
    @IBAction func btnReset(_ sender: UIButton) {
        tfNum1.text = ""
        tfNum2.text = ""
        tfAddition.text = ""
        tfMultiply.text = ""
        tfSubtraction.text = ""
        tfDivisionRemainder.text = ""
        tfDivisionQuotient.text = ""
        tfMessage.text = ""
    }
    // 메모리 위해 기능을 분류해서 펑션으로
    func calculation(_ intNum1: Int, _ intNum2: Int){
        if (intNum1 % 2 == 0 && intNum2 % 2 == 0){
        tfAddition.text = String(intNum1 + intNum2)
        }
        tfDivisionQuotient.text = String(intNum1/intNum2)
        tfSubtraction.text = String(intNum1 - intNum2)
        tfMultiply.text = String(intNum1*intNum2)
        
        tfDivisionRemainder.text = String(intNum1%intNum2)
        
        tfMessage.text = "계산이 완료되었습니다."
    }
    
    /*
     @IBAAction  func btnAdd(_ sender: UIButton) {
     //Optional Unwrapping
        guard let strNum1 = tfNum1.text else { return }
        guard let strNum2 = tfNum2.text else { return }
     }
     
     // 입력 체크
     let checkResult = checkNilSpace(strNum1: strNum1, strNum2: strNum2)
     if checkResult == 0{
        lblMessage.text = "숫자를 확인하세요!"
     }else{
        // 짝수 홀수 판단
        let numNum1 = Int(strNum1)
        let numNum2 = Int(strNum2)
        checkEvenOdd(num1: numNum1!, num2: numNum2!)
     }
     
     func checkEvenOdd(num1: Int, num2: Int){
        if num1 % 2 == 0 && num2 % 2 == 0{
            let numResult = num1 + num2
            tfResult.text = String(numResult)
            lblMessage.text = "계산이 완료되었습니다."
        }else {
            lblMessage.text = "계산이 잘못되었습니다."
        }
     }
     
     func checkNilSpace(strNum1: String, strNum2: String) -> Int{
        let checkNum1 = strNum1.trimmingCharacters(in: .whitespacesAndNewlines)
        let checkNum2 = strNum2.trimmingCharacters(in: .whitespacesAndNewlines)
     
        if checkNum1.isEmpty || checkNum2.isEmpty{
            return 0
        }else{
            return 1
        }
     }
     */
    
    func readOnly() {
        tfAddition.isUserInteractionEnabled = false
        tfSubtraction.isUserInteractionEnabled = false
        tfMultiply.isUserInteractionEnabled = false
        tfDivisionQuotient.isUserInteractionEnabled = false
        tfDivisionRemainder.isUserInteractionEnabled = false
    }
    
    // 키보드 안보이게 하기(타이핑이 끝났다고 신호주기)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    

}

