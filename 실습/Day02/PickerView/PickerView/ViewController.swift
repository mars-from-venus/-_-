//
//  ViewController.swift
//  PickerView
//
//  Created by mars on 2021/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblfileName: UILabel!
    
    var imageFileName = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    var imageArray = [UIImage?]() // Image배열
    let Max_Array_Num = 10 // 전체 이미지 갯수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Image배열에 Image 넣기
        for i in 0..<imageFileName.count{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lblfileName.text = imageFileName[0]
        imgView.image = imageArray[0]
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }

}

extension ViewController : UIPickerViewDataSource,UIPickerViewDelegate{
    // pickerview의 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    // pickerview에 파일명 배치 : title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return imageFileName[row]
    }
    // 썸네일 띄우기
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let imageView = UIImageView(image: imageArray[row])
//        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
//        return imageView
//    }
    // pickerview로 선택된 파일명의 레이블 및 image 출력 : didSelect
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblfileName.text = imageFileName[row]
        imgView.image = imageArray[row]
    }

}


