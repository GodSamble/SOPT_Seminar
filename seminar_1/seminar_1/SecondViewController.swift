//
//  SecondViewController.swift
//  seminar_1
//
//  Created by 고영민 on 2023/06/30.
//

import UIKit

final class SecondViewController: UIViewController {
    
    var name : String?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "저의 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setSendData()
    }
    
}
private extension SecondViewController {
    func setStyle() {
        view.backgroundColor = .white
    }
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    @objc
    func backButtonTapped(){
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setSendData(){
        guard let name = self.name else { return }
        nameLabel.text = (name=="") ? "ㅋㅋ 너 아무것도 입력 안했지!!" : "저는 \(name)입니다"
    }
}
