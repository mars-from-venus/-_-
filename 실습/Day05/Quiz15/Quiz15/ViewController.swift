//
//  ViewController.swift
//  Quiz15
//
//  Created by mars on 2021/10/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    var pages = ["www.sbs.co.kr","www.kbs.co.kr","www.imbc.com","www.jtbc.joins.com"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // pageControl
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        // 초기 화면
        loadPage(url:pages[0])
        myWebView.navigationDelegate = self
        // swipe 기능
        makeSingleTouch()
    }
    func loadPage(url:String) {
        let url = URL(string:"https://"+url)
        let myRequire = URLRequest(url: url!)
        myWebView.load(myRequire)
    }
    // swipe
    func makeSingleTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage = pageControl.currentPage - 1
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage = pageControl.currentPage + 1
            default:
                break
            }
        }
        loadPage(url:pages[pageControl.currentPage])
    }
    @IBAction func btnPage(_ sender: UIPageControl) {
        loadPage(url:pages[pageControl.currentPage])
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
