//
//  ViewController.swift
//  Quiz11
//
//  Created by mars on 2021/10/17.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var lblDatePicker: UIPickerView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    var url = ["www.naver.com","www.nate.com",
               "www.daum.net","www.cnn.com","www.google.com",
               "www.cbs.com", "www.jtbc.com"
    ]
    var url2:[String:String] = ["www.naver.com":"NAVER","www.nate.com":"NATE",
                                "www.daum.net":"DAUM","www.cnn.com":"CNN","www.google.com":"GOOGLE",
                                "www.cbs.com":"CBS", "www.jtbc.com":"JTBC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblDatePicker.dataSource = self
        lblDatePicker.delegate = self
        myWebView.navigationDelegate = self
        loadUrl(url[0])
    }
    func loadUrl(_ url:String){
        let url = URL(string:"http://"+url)
        let myRequest = URLRequest(url: url!)
        myWebView.load(myRequest)
    }
}

extension ViewController:UIPickerViewDataSource{
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return url.count
    }
}

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //url[row]
        return url2[url[row]]
       
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let myUrl = URL(string:"http://"+url[row])
//        let myRequest = URLRequest(url: myUrl!)
//        myWebView.load(myRequest)
        return loadUrl(url[row])
    }
}

extension ViewController:WKNavigationDelegate {
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
