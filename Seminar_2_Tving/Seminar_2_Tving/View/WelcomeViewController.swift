//
//  WelcomeViewController.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 2023/07/04.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class WelcomeViewController: UIViewController {
    
    
    private let disposeBag = DisposeBag()
    private let logoView = UIImageView()
    private let welcomeLabel = UILabel()
    private let moveMainButton = UIButton()
    private let moveHomeButton = UIButton()
    var userNickname: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setBindings()
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
            $0.setTitle("로그인창으로", for: .normal)
            $0.titleLabel?.font = UIFont.tvingSemiBold(ofSize: 14);
            $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
            $0.backgroundColor = UIColor.colorFF143C
            $0.titleLabel?.textAlignment = .center
            $0.layer.cornerRadius = 3
        }
        
        moveHomeButton.do {
            $0.setTitle("메인홈으로", for: .normal)
            $0.titleLabel?.font = UIFont.tvingSemiBold(ofSize: 14);
            $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
            $0.backgroundColor = UIColor.colorFF143C
            $0.titleLabel?.textAlignment = .center
            $0.layer.cornerRadius = 3
        }
    }
    
    private func setBindings() {
        Observable.just(userNickname)
            .map{ "\($0)님 반가워요!" }
            .bind(to: welcomeLabel.rx.text)
            .disposed(by: disposeBag)
        
        moveMainButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handleMoveMainButtonTap()
            })
            .disposed(by: disposeBag)
        
        moveHomeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handleMoveHomeButtonTap()
            })
            .disposed(by: disposeBag)
    }
    
    private func handleMoveMainButtonTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    private func handleMoveHomeButtonTap() {
        let mainHomeView = MainHomeView()
        self.navigationController?.pushViewController(mainHomeView, animated: true)
    }
    
    private func setLayout() {
        [logoView, welcomeLabel, moveMainButton, moveHomeButton].forEach {
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
        moveHomeButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(moveMainButton.snp.top).offset(-22)
            $0.height.equalTo(52)
        }
    }
}
