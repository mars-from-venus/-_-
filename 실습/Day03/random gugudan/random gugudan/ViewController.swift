//
//  ViewController.swift
//  random gugudan
//
//  Created by mars on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNum1: UILabel!
    @IBOutlet weak var lblNum2: UILabel!
    @IBOutlet weak var tfResult: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblNum1.text = genNum()
        lblNum2.text = genNum()
    }
    func genNum() -> String{
        return String(Int.random(in: 1..<10))
    }

    @IBAction func btnResult(_ sender: UIButton) {
        let answer = Int(lblNum1.text!)! * Int(lblNum2.text!)!
        let result = Int(tfResult.text!)!
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
                self.lblNum1.text = self.genNum()
                self.lblNum2.text = self.genNum()
            })
            calcOnAlert.addAction(onAction)
            present(calcOnAlert, animated: true, completion: nil)
        }

}

}
