//
//  ViewController.swift
//  Quiz06
//
//  Created by mars on 2021/10/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgTilte: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    var numImage = 0 // 상태변수
    var timeInterval = 1.0
    var count1 = 0
    var count2 = 0
    
    // 지역변수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector:#selector(updateTime), userInfo: nil, repeats: true)
        imgTilte.text?.removeAll()
        displayImage(number: numImage)
        displayImage2(number: numImage)
    }
    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        if numImage < 0{
            numImage = imageName.count - 1
        }
        displayImage(number: numImage)
    }
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if numImage >= imageName.count{
            numImage = 0
        }
            displayImage(number: numImage)
    }
    @objc func updateTime(){
        count1 += 1
        if count1 % 3 == 0 {
            numImage += 1
            if numImage >= imageName.count {
                numImage = 0
            }
            displayImage(number:numImage)
        }
        if count2 % 1 == 0 {
            numImage += 1
            if numImage >= imageName.count {
                numImage = 0
            }
            displayImage2(number: numImage)
        }
       
    }
    func displayImage(number: Int){
        imgView.image = UIImage(named: imageName[number])
        imgTilte.text = imageName[number]
    }
    func displayImage2(number: Int){
        imgView2.image = UIImage(named: imageName[number])
        imgTilte.text = imageName[number]
    }
}

