//
//  ViewController.swift
//  Quiz13
//
//  Created by mars on 2021/10/17.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    var urls = ["www.daum.net","www.naver.com","www.nate.com","www.cnn.com","www.google.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        loadPage(urls[0])
        lblText.text = urls[0]
        pageControl.currentPage = 0
        pageControl.numberOfPages = urls.count
    }
    @IBAction func pageChange(_ sender: UIPageControl){
        loadPage(urls[pageControl.currentPage])
        lblText.text = urls[pageControl.currentPage]
    }
    func loadPage(_ url: String){
        let url = URL(string:"http://"+url)
        let myRequest = URLRequest(url: url!)
        myWebView.load(myRequest)
    }
}

extension ViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation){
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
}

