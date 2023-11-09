//
//  ViewController.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 2023/07/01.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class SignInViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    private let disposeBag = DisposeBag()
    private let signinViewModel = SignInViewModel()
    private let backButton = UIButton()
    private let signInLabel = UILabel()
    private let idTextField = UITextField()
    private lazy var idClearButton = UIButton()
    private let passwordTextField = UITextField()
    private lazy var passwordClearButton = UIButton()
    private lazy var passwordSecurityButton = UIButton()
    private let signInButton = UIButton()
    private let idFindButton = UIButton()
    private let betweenView = UIView()
    private let passwordFindButton = UIButton()
    private let accountLabel = UILabel()
    private let createNicknameButton = UIButton()
    
    var nickname: String = "아무 입력 안됨"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setTarget()
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
            $0.textColor = UIColor.color9C9C9C
            $0.layer.cornerRadius = 3
            $0.autocapitalizationType = .none
            //$0.setLeftPaddingPoints(22)
            $0.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 0))
        }
        
        idClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
            $0.isHidden = true
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.setPlaceholderColor(UIColor.color9C9C9C)
            $0.backgroundColor = UIColor.color2E2E2E
            $0.font = UIFont.tvingSemiBold(ofSize: 15)
            $0.textColor = UIColor.color9C9C9C
            $0.layer.cornerRadius = 3
            $0.autocapitalizationType = .none
            $0.isSecureTextEntry = true
            $0.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 0))
            $0.rightViewMode = .always
            //   $0.setLeftPaddingPoints(22)
        }
        
        passwordClearButton.do {
            $0.setImage(Image.deleteIcon, for: .normal)
            $0.isHidden = true
        }
        
        passwordSecurityButton.do {
            $0.setImage(Image.passwordHideIcon, for: .normal)
            $0.isHidden = true
        }
        
        signInButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.titleLabel?.font = UIFont.tvingSemiBold(ofSize: 14)
            $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
            $0.layer.borderColor = UIColor.color9C9C9C.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 3
            $0.isEnabled = false
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
            $0.titleLabel?.font = UIFont.tvingSemiBold(ofSize: 14)
        }
        
        accountLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.textColor = UIColor.color9C9C9C
            $0.font = UIFont.tvingSemiBold(ofSize: 14)
        }
        
        createNicknameButton.do {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.titleLabel?.font = UIFont.tvingRegular(ofSize: 14)
            $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
            $0.setUnderline()
        }
    }
    
    private func setTarget(){
         idClearButton
             .addTarget(self,
                      action: #selector(idClearButtonTapped),
                      for: .touchUpInside)
         passwordClearButton.addTarget(self, action: #selector(passwordClearButtonTapped), for: .touchUpInside)
         passwordSecurityButton.addTarget(self, action: #selector(passwordSecurityButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        createNicknameButton.addTarget(self, action: #selector(createNicknameButtonTapped), for: .touchUpInside)
     }
    
    private func setBindings() {
        idTextField.rx.text.orEmpty
            .bind(to: signinViewModel.id)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: signinViewModel.password)
            .disposed(by: disposeBag)
        
        signinViewModel.isValid
            .bind(to: signInButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        signInButton.rx.tap
            .subscribe(onNext: { [weak self] in
                //                self?.signinViewModel.signin
            })
            .disposed(by: disposeBag)
    }
    
    

    private func setLayout() {
        [backButton, signInLabel, idTextField, passwordTextField, signInButton,idFindButton, betweenView, passwordFindButton, accountLabel, createNicknameButton].forEach {
            view.addSubview($0)
        }
        [idClearButton].forEach {
            idTextField.addSubview($0)
        }
        [passwordClearButton, passwordSecurityButton].forEach {
            passwordTextField.addSubview($0)
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
        
        idClearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordClearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().offset(-56)
        }
        
        passwordSecurityButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
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
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(22)
        }
        
        createNicknameButton.snp.makeConstraints{
            $0.top.equalTo(passwordFindButton.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(44)
            $0.height.equalTo(22)
        }
    }
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc
    private func idClearButtonTapped(){
        idTextField.text?.removeAll()
        idClearButton.isHidden = true
        signInButton.isEnabled = false
        textFieldButtonSetting(textField: idTextField)
        loginButtonActivate()
    }
    
    @objc
    private func passwordClearButtonTapped(){
        passwordTextField.text?.removeAll()
        passwordClearButton.isHidden = true
        signInButton.isEnabled = false
        textFieldButtonSetting(textField: passwordTextField)
        loginButtonActivate()
    }
    
    @objc
    private func passwordSecurityButtonTapped(){
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    func signInButtonTapped() {
        let welcomeViewController = WelcomeViewController()
        print(nickname)
        welcomeViewController.userNickname = self.nickname ?? ""
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func createNicknameButtonTapped() {
        let nicknameViewController = NicknameViewController()
        nicknameViewController.delegate = self
        if let sheet = nicknameViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 50
        }
        self.present(nicknameViewController, animated: true)
    }
    
    private func textFieldBorderSetting(textField: UITextField) {
        textField.layer.borderColor = UIColor.color9C9C9C.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = .none
    }
    
    private func textFieldButtonSetting(textField: UITextField) {
        guard let text = textField.text else {return}
        switch textField
        {
        case idTextField:
            if !text.isEmpty && idTextField.isEditing{
                idClearButton.isHidden = false
            }else {
                idTextField.placeholder = "아이디"
                idClearButton.isHidden = true
            }
        case passwordTextField:
            if !text.isEmpty && passwordTextField.isEditing {
                passwordClearButton.isHidden = false
                passwordSecurityButton.isHidden = true
            }
        default:
            return
        }
    }
    
    private func loginButtonActivate() {
        if signInButton.isEnabled == true {
            signInButton.backgroundColor = UIColor.colorFF143C
            signInButton.setTitleColor(UIColor.colorFFFFFF, for: .normal)
            signInButton.layer.borderWidth = 0
        } else {
            signInButton.setTitleColor(UIColor.color9C9C9C, for: .normal)
            signInButton.backgroundColor = UIColor.color000000
            signInButton.layer.borderWidth = 1
        }
    }
}


extension SignInViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textFieldButtonSetting(textField: textField)
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldBorderSetting(textField: textField)
        textFieldButtonSetting(textField: textField)
    }
    
    //func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textFieldButtonSetting(textField: textField)
        if idTextField.hasText && passwordTextField.hasText {
            signInButton.isEnabled = true
            loginButtonActivate()
        } else {
            signInButton.isEnabled = false
            loginButtonActivate()
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let text = idTextField.text
        if text == "" {
            idClearButton.isHidden = true
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldButtonSetting(textField: textField)
        textField.layer.borderWidth = 0
    }
}

extension SignInViewController: DataBindProtocol {
    func dataBind(userNickName: String) {
        self.nickname = userNickName
    }
}
