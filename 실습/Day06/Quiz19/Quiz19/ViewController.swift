//
//  ViewController.swift
//  Quiz19
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
        Message.isOn = isOn
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        editViewController.isOn = isOn
        editViewController.redOn = isRed
    }
    override func viewWillAppear(_ animated: Bool) {
        if Message.isRed == true{
            imgView.image = imgRed
        }else{
            if Message.isOn == true{
                imgView.image = imgOn
            }else{
                imgView.image = imgOff
            }
        }
        
    }
}
