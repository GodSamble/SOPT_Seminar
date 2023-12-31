//
//  ViewController.swift
//  seminar_1
//
//  Created by 고영민 on 2023/06/29.
//

import UIKit

final class FirstViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "솝트에 오신 여러분 환영합니다!"
        label.textColor = .blue
        return label
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
         button.setTitle("present!", for: .normal)
         button.backgroundColor = .yellow
         button.setTitleColor(.blue, for: .normal)
         button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
         return button
        
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
         textField.placeholder = "이름을 입력해주세요"
         textField.clearButtonMode = .whileEditing
         textField.layer.borderColor = UIColor.gray.cgColor
         textField.layer.borderWidth = 1
         return textField
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        
    }
    
}
private extension FirstViewController {
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController(){
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.name = nameTextField.text
        self.present(secondViewController, animated: true)
    }
    func pushToSecondViewController(){
        let secondViewController = SecondViewController()
        secondViewController.name = nameTextField.text
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    @objc
    func presentButtonTapped(){
        presentToSecondViewController()
    }
    @objc
    func pushButtonTapped(){
        pushToSecondViewController()
    }
}
