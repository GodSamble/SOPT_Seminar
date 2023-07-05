//
//  NicknameViewController.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 2023/07/05.
//

import UIKit
import SnapKit
import Then

final class NicknameViewController: UIViewController {
    private let nicknameLabel = UILabel()
    private let nicknameTextField = UITextField()
    private let nicknameSaveButton = UIButton()
    
    override func viewDidLoad() {
        setUI()
        setLayout()
    }
}

extension NicknameViewController {
    private func setUI() {
        view.backgroundColor = UIColor.colorFFFFFF
        nicknameLabel.do {
            $0.text = "닉네임을 입력해주세요"
            $0.font = UIFont.tvingSemiBold(ofSize: 14);
        }
        nicknameTextField.do {
            $0.placeholder = "닉네임"
            $0.backgroundColor = UIColor.color9C9C9C
            $0.textColor = UIColor.color000000
            $0.font = UIFont.tvingSemiBold(ofSize: 14);
            $0.layer.cornerRadius = 3
            //Padding
        }
        nicknameSaveButton.do {
            $0.setTitle("저장하기", for: .normal)
            $0.titleLabel?.font = UIFont.tvingSemiBold(ofSize: 14);
            $0.setTitleColor(UIColor.color000000, for: .normal)
            $0.backgroundColor = UIColor.colorFF143C
            $0.layer.cornerRadius = 12
        }
    }
    
    private func setLayout() {
        [nicknameLabel, nicknameTextField, nicknameSaveButton].forEach {
            view.addSubview($0)
        }
        nicknameLabel.snp.makeConstraints{
             $0.top.equalToSuperview().inset(52)
             $0.leading.equalToSuperview().inset(20)
         }

         nicknameTextField.snp.makeConstraints{
             $0.height.equalTo(52)
             $0.top.equalTo(nicknameLabel.snp.bottom).offset(21)
             $0.leading.trailing.equalToSuperview().inset(20)
         }

         nicknameSaveButton.snp.makeConstraints{
             $0.height.equalTo(52)
             $0.bottom.equalToSuperview().inset(20)
             $0.leading.trailing.equalToSuperview().inset(20)
         }
    }
}
