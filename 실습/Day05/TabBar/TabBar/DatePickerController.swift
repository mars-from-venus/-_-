//
//  ViewController.swift
//  DatePicker
//
//  Created by Kenny on 2021/01/11.
//

import UIKit

class DatePickerController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let timeSelector: Selector = #selector(DatePickerController.updateTime)
    let interval = 1.0 // 시간 interval 1초
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // 년도-월-일 요일 (오전/오후) 12시간:분:초 , 24시간은 HH 사용
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"
    }
    
    // Async Task로 1초당 1번씩 구동
    @objc func updateTime(){
        let date = NSDate() // Next Step
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))" 
    }
}

