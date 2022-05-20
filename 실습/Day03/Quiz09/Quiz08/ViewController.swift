//
//  ViewController.swift
//  Quiz08
//
//  Created by mars on 2021/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tvNumber: UITextView!
    
    var numbers = [Int](2...9) // 생성자 안 데이터
    var firstNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblName.text = "\(numbers[0])단"
        gugudan(numbers[0])
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    func gugudan(_ firstNum:Int){
        for e in 1...9{
            tvNumber.text += "\(firstNum) X \(e) = \(String(firstNum * e)) \n"
            }
        }
    
}

// instance를 만들지 않고 사용 dataSource와 delegate로 연결되서
// extenstion은 class에 포함됨
extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return numbers.count
    }
}

extension ViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numbers[row]) + "단"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblName.text = "\(numbers[row])단"
        tvNumber.text = ""
        gugudan(Int(row) + 2)
    }
}


// closure 공유되지 않고 혼자 쓰는 함수
