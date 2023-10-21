//
//  SignInViewModel.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 10/21/23.
//

import Foundation
import RxSwift
import RxCocoa


final class SignInViewModel {
    
    var id = BehaviorSubject<String>(value: "")
    var password = BehaviorSubject<String>(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(id.asObserver(), password.asObservable())
            .map { id, password in
                return !id.isEmpty && !password.isEmpty
            }
    }
    
    
    
    var nickname: String = "아무 입력 안됨"
    
    
    func validateCredentials(id: String, password: String) -> Bool {
        return !id.isEmpty && !password.isEmpty
    }
    
    func performSignIn(id: String, password: String) -> Bool {
        return true
    }
}
