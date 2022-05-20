//
//  ViewController.swift
//  SwipeGesture
//
//  Created by mars on 2021/10/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgViewUP: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    var numOfTouches = 2 //  두 손가락이 Max
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Image 설정하기
        makeImages()
        
        // 초기 Image
        imgViewUP.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        // 한 손가락 Gesture 구성
        makeSingleTouch()
        
        // 두 손가락 Gesture 구성
        makeDoubleTouch()
    }
    
    func makeImages(){
        imgUp.append(UIImage(named: "arrow-up-black")!)
        imgDown.append(UIImage(named: "arrow-down-black")!)
        imgLeft.append(UIImage(named: "arrow-left-black")!)
        imgRight.append(UIImage(named: "arrow-right-black")!)
        
        imgUp.append(UIImage(named: "arrow-up-red")!)
        imgDown.append(UIImage(named: "arrow-down-red")!)
        imgLeft.append(UIImage(named: "arrow-left-red")!)
        imgRight.append(UIImage(named: "arrow-right-red")!)
        
        imgUp.append(UIImage(named: "arrow-up-green")!)
        imgDown.append(UIImage(named: "arrow-down-green")!)
        imgLeft.append(UIImage(named: "arrow-left-green")!)
        imgRight.append(UIImage(named: "arrow-right-green")!)
    }
    func makeDoubleTouch(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGestureMulti(_ :)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        swipeUp.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGestureMulti(_ :)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        swipeDown.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGestureMulti(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGestureMulti(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRight)
    }
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer){
        if let swipreGesture = gesture as? UISwipeGestureRecognizer{
            imgViewUP.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipreGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUP.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            default:
                break
            }
        }
    }
    func makeSingleTouch(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_ :)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_ :)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipreGesture = gesture as? UISwipeGestureRecognizer{
            imgViewUP.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipreGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUP.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            default:
                break
            }
        }
    }


}

