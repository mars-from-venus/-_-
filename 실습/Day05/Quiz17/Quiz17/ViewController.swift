//
//  ViewController.swift
//  Quiz17
//
//  Created by mars on 2021/10/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.myWebView.navigationDelegate = self
       // 인스턴스를 이용한 Web 구성
//        let myRequest = SiteRequest();
//        myWebView.load(myRequest.loadWebpage(url: "https://www.naver.com"))
        // 인스턴스를 이용한 Web 구성2
        let site2: SiteRequest2 = SiteRequest2("https://www.naver.com")
        let myRequest2 = site2.loadWebpage()
        myWebView.load(myRequest2)
    }
}




