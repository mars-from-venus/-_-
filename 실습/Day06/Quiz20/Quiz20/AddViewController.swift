//
//  AddViewController.swift
//  Quiz20
//
//  Created by mars on 2021/10/24.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tfLabel: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    var imagesName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named:images[0])
        tfLabel.text = items[0]
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    @IBAction func btnDone(_ sender: UIButton) {
        items.append(tfLabel.text!)
        images.append(imagesName)
        navigationController?.popViewController(animated: true)
    }

}

extension AddViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: images[row]) )
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
            return imageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = UIImage(named: images[row])
        imagesName = images[row]
        tfLabel.text = items[row]
    }
    
}
