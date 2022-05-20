//
//  GViewController.swift
//  Quiz17
//
//  Created by mars on 2021/10/23.
//

import UIKit
import WebKit

class GViewController : UIViewController {

    @IBOutlet var myWebView:WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.myWebView.navigationDelegate = self
        // 인스턴스를 이용한 Web 구성
         let myRequest = SiteRequest();
         myWebView.load(myRequest.loadWebpage(url: "https://www.google.com"))
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
//
//extension GViewController : WKNavigationDelegate{
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//        myActivityIndicator.startAnimating()
//        myActivityIndicator.isHidden = false
//    }
//    // Indicator 종료
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        myActivityIndicator.stopAnimating()
//        myActivityIndicator.isHidden = true
//    }
//    // Error발생
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        myActivityIndicator.stopAnimating()
//        myActivityIndicator.isHidden = true
//    }
//}
