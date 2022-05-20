//
//  ViewController.swift
//  Hybrid
//
//  Created by mars on 2021/10/16.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 초기화면으로 네이버 띄우기
        myWebView.navigationDelegate = self
        loadWebpage(url: "https://www.naver.com")
    }
    @IBAction func btnSite1(_ sender: UIButton) {
        // http://www.google.com
        loadWebpage(url: "http://www.google.com")
    }
    @IBAction func btnSite2(_ sender: UIButton) {
        // http://www.daum.net
        loadWebpage(url: "http://www.daum.net")
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    // html을 변수로 지정하여 사용하기
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = """
        <html>
            <head>
                <meta charset = "utf-8">
                <meta name = "viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body>
                <h1>HTML String</h1>
                <p>String 변수를 이용한 웹페이지</p>
                <p><a href="http://jtbc.joins.com">JTBC</a>로 이동</p>
            </body>
        </html>
        """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(tfUrl.text!)
        tfUrl.text = ""
        loadWebpage(url: myUrl)
//        loadWebpage(url: "http://\(tfUrl.text!)")
    }
    
    // 사용자가 http를 사용했는지 여부 확인
    func checkUrl(_ url:String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl = "http://" + url
        }
        return strUrl
    }
    
    // html 읽는 함수
    func loadWebpage(url: String){
        let myUrl = URL(string: url) // URL은 naver로 가는걸 아는애(보낼때)
        let myRequest = URLRequest(url: myUrl!) // 받을 위치를 알려주는 애(받을떄)
        myWebView.load(myRequest)
    }

}

extension ViewController: WKNavigationDelegate {
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    // Error발생
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
}
