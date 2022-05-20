//
//  ViewController.swift
//  Quiz08
//
//  Created by Kenny on 2021/01/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var numImage = 0
    var imageName = [ "flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png" ]
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 3.0 // interval을 3초로

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        imgView.image = UIImage(named:imageName[0])
        imgTitle.text = imageName[0]

    }

    @objc func updateTime(){

        numImage = numImage + 1
        if (numImage>=imageName.count) {
            numImage = 0
        }
        
        imgView.image = UIImage(named:imageName[numImage])
        imgTitle.text = imageName[numImage]

    }

}

