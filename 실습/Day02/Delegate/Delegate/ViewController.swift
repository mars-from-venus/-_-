//
//  ViewController.swift
//  Delegate
//
//  Created by mars on 2021/10/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfInput.delegate = self // 누구한테 넣어주는지 정해줘야 함 권한을 줌
    }
    @IBAction func btnAction(_ sender: UIButton) {
        lblResult.text = tfInput.text
    }
    

}// ViewController

extension ViewController : UITextFieldDelegate{
    // Return으로 실행
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lblResult.text = tfInput.text
        return true
    }
}
