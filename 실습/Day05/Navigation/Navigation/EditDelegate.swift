//
//  EditDelegate.swift
//  Navigation
//
//  Created by mars on 2021/10/24.
//

// segue 방식 대신 protocol 방식이 있음
protocol EditDelegate {
    // 수정화면에서 Message를 메인화면으로 보내기
    func didMessageEditDone(_ controller: EditViewController, Message: String)
    // 수정화면에서 Switch 작동
    func didIsSwitch(_ controller: EditViewController, IsOnOff: Bool)
}
