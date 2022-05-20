//
//  ViewController.swift
//  Alert Message
//
//  Created by mars on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectedTime: UILabel!
    var interval = 1.0
    var alarmTime:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let datePikcer = sender
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "YYYY-MM-dd EEE a hh:mm:ss"
        lblSelectedTime.text = "선택시간 : \(formatter.string(from: datePikcer.date))"
        
        formatter.dateFormat = "a hh:mm"
        alarmTime = formatter.string(from: datePikcer.date)
    }
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "YYYY-MM-dd EEE a hh:mm:ss"
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "a hh:mm"
        let currentTime = formatter.string(from: date as Date)
        if alarmTime == currentTime {
            let alert = UIAlertController(title: "알림", message: "설정된 시간입니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "네,알겠습니다.", style: .default, handler:   nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            self.view.backgroundColor = UIColor.gray
        }
    }
}

