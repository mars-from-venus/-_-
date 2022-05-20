//
//  ViewController2.swift
//  random gugudan
//
//  Created by mars on 2021/10/16.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func genNum() -> String{
        return String(Int.random(in: 1..<10))
    }
    @IBAction func btnOK(_ sender: UIButton){
        let answer: Int = Int(num1.text!)! * Int(num2.text!)! // 정답
        let result: Int = Int(tfResult.text!)! // 사용자 입력값
        if answer != result {
            let calcOnAlert = UIAlertController(title: "결과", message: "정답이 아닙니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: .default, handler: {action in
                self.tfResult.text = ""
            })
            calcOnAlert.addAction(onAction)
            present(calcOnAlert, animated: true, completion: nil)
        }
        if answer == result{
            let calcOnAlert = UIAlertController(title: "결과", message: "정답 입니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "다음 문제 진행", style: .default, handler: {action in
                self.tfResult.text = ""
                self.num1.text = self.genNum()
                self.num2.text = self.genNum()
            })
            calcOnAlert.addAction(onAction)
            present(calcOnAlert, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
