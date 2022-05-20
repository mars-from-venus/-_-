//
//  ViewController.swift
//  Quiz14
//
//  Created by mars on 2021/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 첫화면 이미지
        imgView.image = UIImage(named: images[0])
        // Page Control기능 정의
        pageControl.currentPage = 0
        pageControl.numberOfPages=images.count
        pageControl.pageIndicatorTintColor=UIColor.black
        pageControl.currentPageIndicatorTintColor=UIColor.red
        // Swipe 기능 정의
        makeSingleTouch()
    }

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
            imgView.image = UIImage(named:images[0])
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:                pageControl.currentPage = pageControl.currentPage-1

            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage = pageControl.currentPage + 1
            default:
                break
            }
        }
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }

@IBAction func btnPage(_ sender: UIPageControl) {
    imgView.image = UIImage(named: images[pageControl.currentPage])
}
}

