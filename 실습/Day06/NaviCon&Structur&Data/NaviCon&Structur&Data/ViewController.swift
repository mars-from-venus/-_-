//
//  ViewController.swift
//  NaviCon&Structur&Data
//
//  Created by mars on 2021/10/24.
//
// Navigation Control과 Structure를 이용한 Data공유

import UIKit

// unit test
// navi는 연결된 화면이 뒤에 계속 띄어져있음
class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tfMessage: UITextField!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
    }
    
    // EditViewController가 없어진 후 실행되는 함수
    override func viewWillAppear(_ animated: Bool) {
        tfMessage.text = Message.message
        if Message.isOn == true {
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
    
    // Life cycle 함수 : 앱이 생성되서 죽을때까지 실행되는 함수들
    // segue 방식은 보내는쪽에서만 알 수 있음
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController // segue는 복사본이 아님
        if segue.identifier == "editButton"{
            editViewController.lblWayValue = "Segue: Use Button!"
        }else{
            editViewController.lblWayValue = "Segue: Use BarButton!"
        }
        Message.message = tfMessage.text!
    }
}// ViewController
