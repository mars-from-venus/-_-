//
//  ViewController.swift
//  Quiz12
//
//  Created by mars on 2021/10/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    var numbers = [Int](1...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textControl(.red)
        pageControl.numberOfPages = numbers.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.blue
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        if pageControl.currentPage % 2 == 0 {
            textControl(.red)
        } else {
            textControl(.blue)
        }
    }
    func textControl(_ color:UIColor){
        lblNumber.textColor = color
        lblNumber.textAlignment = .center
        lblNumber.text = String(pageControl.currentPage+1)
    }
    
}

// i)Scratch Coding
// ii) code for optimizing => Maintenance

