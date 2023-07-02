//
//  ViewController.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 2023/07/01.
//

import UIKit
import SnapKit
import Then

final class SignInViewController: UIViewController {
    
    private let backButton = UIButton()
    private let signInLabel = UILabel()
    private let idTextField = UITextField()
    private let idClearButton = UIButton()
    private let passwordTextField = UITextField()
    private let passwordClearButton = UIButton()
    private let passwordSecurityButton = UIButton()
    private let signInButton = UIButton()
    private let idFindButton = UIButton()
    private let betweenView = UIView()
    private let passwordFindButton = UIButton()
    private let accountLabel = UILabel()
    private let createButton = UIButton()
    
    private let idButtonView = UIView()
    private let passwordButtonView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension SignInViewController {
    private func setUI() {
        
        view.backgroundColor = UIColor.color000000
        
        backButton.do {
            $0.setImage(Image.backButtonIcon, for: .normal)
        }
        
        signInLabel.do {
            $0.text = "TVING ID 로그인"
            $0.font = UIFont.tvingSemiBold(ofSize: 23);            $0.textAlignment = .center
            $0.textColor = UIColor.colorFFFFFF
        }
        
        idTextField.do {
            $0.placeholder = "아이디"
            $0.setPlaceholderColor(UIColor.color9C9C9C)
            $0.backgroundColor = UIColor.color2E2E2E
            $0.font = UIFont.tvingSemiBold(ofSize: 15)
            $0.textColor = UIColor.color000000
            $0.layer.cornerRadius = 3
            $0.clearButtonMode = .never
            //$0.setLeftPaddingPoints(22)
        }
        
        idClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.setPlaceholderColor(UIColor.color9C9C9C)
            $0.backgroundColor = UIColor.color2E2E2E
            $0.font = UIFont.tvingSemiBold(ofSize: 15)
            $0.textColor = UIColor.color000000
            $0.layer.cornerRadius = 3
            //   $0.setLeftPaddingPoints(22)
        }
        
        passwordClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
        }
        
        passwordSecurityButton.do {
            $0.setImage(Image.passwordHideIcon, for: .normal)
        }
        
        signInButton.do {
            $0.setTitle("로그인하기", for: .normal)
        }
        
        idFindButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
            $0.titleLabel?.font = UIFont.tvingSemiBold(ofSize: 15)
        }
        
        betweenView.do {
            $0.backgroundColor = UIColor.color9C9C9C
        }
        
        passwordFindButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
            $0.titleLabel?.font = UIFont.tvingSemiBold(ofSize: 14)        }
        
        accountLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.textColor = UIColor.color9C9C9C
            $0.font = UIFont.tvingSemiBold(ofSize: 14)
        }
        
        createButton.do {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.titleLabel?.font = UIFont.tvingRegular(ofSize: 14)
            $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
            $0.setUnderline()
        }
    }
    
    
    private func setLayout() {
        //         idButtonView.addSubviews(idClearButton)
        //         passwordButtonView.addSubviews(passwordClearButton, passwordSecurityButton)
        //         view.addSubviews(backButton, signInLabel, idTextField, passwordTextField, signInButton,idFindButton, betweenView, passwordFindButton, accountLabel, createButton, idButtonView, passwordButtonView)
        
        [backButton, signInLabel, idTextField, passwordTextField, signInButton,idFindButton, betweenView, passwordFindButton, accountLabel, createButton, idButtonView, passwordButtonView].forEach {
            view.addSubview($0)
        }
        [passwordClearButton, passwordSecurityButton].forEach {
            passwordButtonView.addSubview($0)
        }
        [idClearButton].forEach {
            idButtonView.addSubview($0)
        }
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(65)
            $0.leading.equalToSuperview().inset(24)
        }
        
        signInLabel.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(109)
        }
        
        idTextField.snp.makeConstraints{
            $0.top.equalTo(signInLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        signInButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        betweenView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signInButton.snp.bottom).offset(36)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        idFindButton.snp.makeConstraints{
            $0.top.equalTo(signInButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(85)
            $0.height.equalTo(22)
        }
        
        passwordFindButton.snp.makeConstraints{
            $0.top.equalTo(signInButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(86)
            $0.height.equalTo(22)
        }
        
        accountLabel.snp.makeConstraints{
            $0.top.equalTo(idFindButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(51)
            $0.height.equalTo(22)
        }
        
        createButton.snp.makeConstraints{
            $0.top.equalTo(passwordFindButton.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(65)
            $0.height.equalTo(22)
        }
        
    }
}
