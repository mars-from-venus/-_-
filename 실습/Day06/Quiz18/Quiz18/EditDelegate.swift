//
//  EditDelegate.swift
//  Quiz18
//
//  Created by mars on 2021/10/24.
//

import Foundation

protocol EditDelegate {
    func didSwithOnOff(_ controller: EditViewController, _ isOn: Bool)
    func didRedOnOff(_ controller: EditViewController, _ isOn: Bool)
}
