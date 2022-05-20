//
//  ViewController.swift
//  Quiz16
//
//  Created by mars on 2021/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnButtonImage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnTimer(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func btnPageControl(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    

}

