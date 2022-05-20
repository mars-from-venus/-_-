//
//  ViewController.swift
//  Quiz18
//
//  Created by mars on 2021/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    var imgOn = UIImage(named: "lamp_on.png")
    var imgOff = UIImage(named: "lamp_off.png")
    var imgRed = UIImage(named: "lamp_red.png")
    
    var isOn : Bool = true
    var isRed : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        editViewController.delegate = self
    }
}

extension ViewController : EditDelegate {
    func didSwithOnOff(_ controller: EditViewController, _ isOn: Bool) {
        if isOn == true{
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    func didRedOnOff(_ controller: EditViewController, _ isOn: Bool) {
        if isOn == true{
            imgView.image = imgRed
            self.isRed = true
        }else{
            if self.isOn == false {
            imgView.image = imgOff
                self.isRed = false
            }else{
                imgView.image = imgOn
                self.isRed = true
            }
        }
    }
}
