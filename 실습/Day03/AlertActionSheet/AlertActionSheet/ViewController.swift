//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by mars on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnAlert(_ sender: UIButton) {
        // UIAlertController 초기화
        let testAlert = UIAlertController(title:"Title" , message :"Message", preferredStyle:.alert)
       // UIAlertAction(title: T##String?, style: T##UIAlertAction.Style, handler: T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: { action in
            print("destructive action called")
        })
        // UIAlertControlloer에 UIAlertAction 추가
        testAlert.addAction(.init(title: "OK", style: .default))
        testAlert.addAction(.init(title: "Cancel", style: .cancel))
        testAlert.addAction(actionDestructive)
        // Alert 출력
        present(testAlert, animated: true)
    }
    @IBAction func btnActionSheet(_ sender: UIButton) {
        let testAlert = UIAlertController(title:"Title" , message :"Message", preferredStyle:.actionSheet)
        testAlert.addAction(.init(title: "짜장면", style: .default))
        testAlert.addAction(.init(title: "탕수육", style: .default))
        testAlert.addAction(.init(title: "Cancel", style: .cancel))
        present(testAlert, animated: true)
    }
    
    

}

