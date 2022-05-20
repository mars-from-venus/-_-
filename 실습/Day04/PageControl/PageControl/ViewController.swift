//
//  ViewController.swift
//  PageControl
//
//  Created by mars on 2021/10/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Page Control 정의
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // 상태변수
        pageControl.pageIndicatorTintColor = UIColor.blue
        pageControl.currentPageIndicatorTintColor = UIColor.brown
        imgView.image = UIImage(named: images[0])
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    

}

