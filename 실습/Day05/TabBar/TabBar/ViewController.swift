//
//  ViewController.swift
//  TabBar
//
//  Created by mars on 2021/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnGoImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnGoDatePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    

}

