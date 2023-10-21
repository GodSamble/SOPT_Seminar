//
//  NicknameViewModel.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 10/21/23.
//

import Foundation
import RxSwift
import RxCocoa

final class NicknameViewModel {
    private var nicknameSubject = BehaviorSubject<String>(value: "아무 입력 안됨")
    
    var nickname: Observable<String> {
        return nicknameSubject.asObservable()
    }
    
    func bindData(nickname: String) {
        nicknameSubject.onNext(nickname)
    }
    
    func getNickname() -> String {
        return (try? nicknameSubject.value()) ?? "아무 입력 안됨"
    }
}
