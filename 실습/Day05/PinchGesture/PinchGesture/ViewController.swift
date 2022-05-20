//
//  ViewController.swift
//  PinchGesture
//
//  Created by mars on 2021/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading" the view.
        imgView.image=UIImage(named: "flower_03")
        // Pinch Setup
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doPinch(_ :)))
        self.view.addGestureRecognizer(pinch)
    }
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1 // 다음 변환을 위해 scale의 속성을 1로 설정
        
    }

}

