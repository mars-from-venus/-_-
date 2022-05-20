//
//  ViewController.swift
//  Navigation
//
//  Created by mars on 2021/10/23.
//

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
    
    // Life cycle 함수 : 앱이 생성되서 죽을때까지 실행되는 함수들
    // segue 방식은 보내는쪽에서만 알 수 있음
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController // segue는 복사본이 아님
        if segue.identifier == "editButton"{
            editViewController.lblWayValue = "Segue: Use Button!"
        }else{
            editViewController.lblWayValue = "Segue: Use BarButton!"
        }
        editViewController.tfMessageValue = tfMessage.text!
        editViewController.delegate = self // 익스텐션으로 정의한 기능을 알 수 있게 함, 권한을 준거
        editViewController.isOn = isOn
    }
}// ViewController

extension ViewController: EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, Message: String) {
        tfMessage.text = Message
    }
    func didIsSwitch(_ controller: EditViewController, IsOnOff: Bool) {
        if IsOnOff == true {
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

