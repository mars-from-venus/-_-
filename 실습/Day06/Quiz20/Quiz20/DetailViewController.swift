//
//  DetailViewController.swift
//  Quiz20
//
//  Created by mars on 2021/10/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    var lblTextValue = ""
    var imageValue:UIImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        lblText.text = lblTextValue
        imgView.image = imageValue
    }
    

}
