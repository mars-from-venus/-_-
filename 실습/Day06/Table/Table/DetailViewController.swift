//
//  DetailViewController.swift
//  Table
//
//  Created by mars on 2021/10/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    var receiveItem = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblText.text = receiveItem
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
