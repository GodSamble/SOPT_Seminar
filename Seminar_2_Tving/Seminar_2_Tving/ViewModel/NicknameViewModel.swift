//
//  NicknameViewModel.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 10/21/23.
//

import Foundation

final class NicknameViewModel {
    private var nickname: String = "아무 입력 안됨"
    
    func bindData(nickname: String) {
        self.nickname = nickname
    }
    
    func getNickname() -> String {
        return nickname
    }
}
