//
//  EditViewController.swift
//  NaviCon&Structur&Data
//
//  Created by mars on 2021/10/24.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    
    var lblWayValue:String = ""
    var tfMessageValue:String = ""

    var isOn: Bool = Message.isOn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text! = lblWayValue
        tfMessage.text = Message.message
       
        swIsOn.isOn = isOn
        if isOn{
            lblOnOff.text = "On"
        } else {
            lblOnOff.text = "Off"
        }
    }
    @IBAction func btnDone(_ sender: Any) {
        Message.message = tfMessage.text!
        Message.isOn = isOn
        navigationController?.popViewController(animated: true)
    }
    @IBAction func swImageOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
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
