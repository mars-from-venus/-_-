//
//  ViewController.swift
//  Alert
//
//  Created by mars on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    let imgOn = UIImage(named: "lamp_on")
    let imgOff = UIImage(named: "lamp_off")
    let imgRemove = UIImage(named: "lamp_remove")
    
    // State Variable
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    @IBAction func btnOn(_ sender: UIButton) {
        if isLampOn == true {
            let alert = UIAlertController(title: "경고", message: "현재 On 상태 입니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "네,알겠습니다.", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            imgView.image = imgOn
            isLampOn = true
        }
    }
    @IBAction func btnOFF(_ sender: UIButton) {
        if isLampOn {
            let alert = UIAlertController(title: "경고", message: "램프를 끄시겠습니까", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "네", style: .default, handler: { action in
                self.imgView.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }else{
            // 경고, 현재 off 상태 입니다. 네, 알겠습니다.
            let alert = UIAlertController(title: "경고", message: "현재 off 상태 입니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "네,알겠습니다", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func btnRemove(_ sender: UIButton) {
        if isLampOn {
            let alert = UIAlertController(title: "램프 제거?", message: "램프를 제거 할까요?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "네,제거합니다", style: .default, handler: {action in
                self.imgView.image = self.imgRemove
                self.isLampOn = false
            })
            let onAction = UIAlertAction(title: "아니오,켭니다", style: .destructive, handler: {action in
                    self.imgView.image = self.imgOn
                    self.isLampOn = true
                })
            let offAction = UIAlertAction(title: "아니오,끕니다", style: .destructive, handler: {action in
                self.imgView.image = self.imgOff
                self.isLampOn = false
            })
            alert.addAction(okAction)
            alert.addAction(onAction)
            alert.addAction(offAction)
            present(alert, animated: true, completion: nil)
            }
        else {
            let alert = UIAlertController(title: "램프 제거?", message: "램프를 제거 할까요?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "네,제거합니다", style: .default, handler: {action in
                self.imgView.image = self.imgRemove
                self.isLampOn = false
            })
            let onAction = UIAlertAction(title: "아니오,켭니다", style: .destructive, handler: {action in
                    self.imgView.image = self.imgOn
                    self.isLampOn = true
                })
            let offAction = UIAlertAction(title: "아니오,끕니다", style: .destructive, handler: {action in
                self.imgView.image = self.imgOff
                self.isLampOn = false
            })
            alert.addAction(okAction)
            alert.addAction(onAction)
            alert.addAction(offAction)
            present(alert, animated: true, completion: nil)
            }
        }
}
    



