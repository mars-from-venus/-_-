//
//  EditViewController.swift
//  Quiz19
//
//  Created by mars on 2021/10/24.
//


import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblIsOnOff: UILabel!
    @IBOutlet weak var lblIsRed: UILabel!
    var isOn : Bool = true
    var redOn : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOn = true
        redOn = false
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
        Message.isOn = isOn
        Message.isRed = redOn
        navigationController?.popViewController(animated: true)
    }
    
}
