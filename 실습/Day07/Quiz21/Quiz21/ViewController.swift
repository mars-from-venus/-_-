//
//  ViewController.swift
//  Quiz21
//
//  Created by mars on 2021/10/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var exampleLabel: UILabel!
    
    var name: String = ""
    var kind: String = ""
    var fly: Bool = true
    var image: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var comment: String
        
        // Do any additional setup after loading the view.
        if fly == true{
            comment = "\n날 수 있습니다."
        }else{
            comment = "\n날 수 없습니다."
        }
        lblComment.text = "이 동물의 이름은 \(name)이며 분류는 \(kind)이고 \(comment)"
        imgView.image = UIImage(named: image)
    }


}

