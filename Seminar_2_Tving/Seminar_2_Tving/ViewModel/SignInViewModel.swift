//
//  SignInViewModel.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 10/21/23.
//

import Foundation

final class SignInViewModel {
    var nickname: String = "아무 입력 안됨"
    
    func bindData(nickname: String) {
        self.nickname = nickname
    }
    
    func validateCredentials(id: String, password: String) -> Bool {
        return !id.isEmpty && !password.isEmpty
    }
    
    func performSignIn(id: String, password: String) -> Bool {
        return true
    }
}
