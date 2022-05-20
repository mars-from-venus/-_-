//
//  ViewController.swift
//  DatePicker
//
//  Created by mars on 2021/10/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let interval = 1.0 // 시간 1초
    let timeSelector: Selector = #selector(ViewController.updateTime)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) //async
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // sender로부터 date 받아옴
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"
    }
    
    // Async Task로 1초당 1번씩 구동
    @objc func updateTime(){
        let date = NSDate() // NS = Next Step
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" // eee:요일 a:am,pm
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))" // NS를 스위프트 데이터로 바꿔줌
    }
}

