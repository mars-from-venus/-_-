//
//  ViewController.swift
//  Quiz06
//
//  Created by Kenny on 2021/01/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var numImage = 0
    var imageName = [ "flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png" ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage(number: numImage)
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
    
    // Image 출력
    func displayImage(number: Int){
        imgView.image = UIImage(named: imageName[number])
        imgTitle.text = imageName[number]
    }
    
    
    
} // -----

