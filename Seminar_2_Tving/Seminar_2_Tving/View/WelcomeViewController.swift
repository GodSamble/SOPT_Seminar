//
//  WelcomeViewController.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 2023/07/04.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    private let logoView = UIImageView()
    private let welcomeLabel = UILabel()
    private let moveMainButton = UIButton()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
        setDataBind(userNickName: "")
    }
}
extension WelcomeViewController {
    private func setUI() {
        view.backgroundColor = UIColor.color000000
        logoView.do {
            $0.image = Image.tivingLogo
        }
        
        welcomeLabel.do {
            $0.text = "반갑습니다"
            $0.textColor = UIColor.color9C9C9C
            $0.font = UIFont.tvingSemiBold(ofSize: 14);
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        moveMainButton.do {
            $0.setTitle("메인으로", for: .normal)
            $0.titleLabel?.font = UIFont.tvingSemiBold(ofSize: 14);
            $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
            $0.backgroundColor = UIColor.colorFF143C
            $0.titleLabel?.textAlignment = .center
            $0.layer.cornerRadius = 3
        }
    }
    
    private func setLayout() {
        [logoView, welcomeLabel, moveMainButton].forEach {
            view.addSubview($0)
        }
        
        logoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.trailing.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoView.snp.bottom).offset(67)
        }
        moveMainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    private func setAddTarget() {
        moveMainButton.addTarget(self, action: #selector(moveMainButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func moveMainButtonTapped(){
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    func setDataBind(userNickName : String) {
        welcomeLabel.text = "\(userNickName)님 반가워요!"
    }
}
