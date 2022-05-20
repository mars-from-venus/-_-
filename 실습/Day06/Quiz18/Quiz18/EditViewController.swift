//
//  EditViewController.swift
//  Quiz18
//
//  Created by mars on 2021/10/24.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblIsOnOff: UILabel!
    @IBOutlet weak var lblIsRed: UILabel!
    var isOn : Bool = true
    var redOn : Bool = true
    var delegate: EditDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func swIsOnOff(_ sender: UISwitch) {
        if sender.isOn{
            lblIsOnOff.text = "On"
            isOn = true
        }else{
            lblIsOnOff.text = "Off"
            isOn = false
        }
    }
    @IBAction func swIsRed(_ sender: UISwitch) {
        if sender.isOn{
            lblIsRed.text = "Red"
            redOn = true
        }else{
            lblIsRed.text = "yellow"
            redOn = false
        }
    }
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate.didSwithOnOff(self, isOn)
            delegate.didRedOnOff(self, redOn)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
