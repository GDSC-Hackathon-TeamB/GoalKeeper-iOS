//
//  LoginViewController.swift
//  GoalKeeper-iOS
//
//  Created by 가은 on 1/13/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let idTextField = UITextField().then {
        $0.placeholder = "ID"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        $0.tintColor = .black
    }
    let pwTextField = UITextField().then {
        $0.placeholder = "PW"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        $0.tintColor = .black
        $0.isSecureTextEntry = true
    }
    let loginButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 1, green: 0.498, blue: 0, alpha: 1)
        $0.setTitle("로그인", for: .normal)
        $0.tintColor = .white
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    let divider = UIView().then {
        $0.backgroundColor = UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1)
    }
    let divider2 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1)
    }
    
    let showPWImage = UIButton().then {
        $0.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        $0.tintColor = UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addView()
        layoutConstraints()
    }
    
}
extension LoginViewController {
    func addView() {
        view.addSubview(idTextField)
        view.addSubview(divider)
        view.addSubview(pwTextField)
        view.addSubview(showPWImage)
        view.addSubview(divider2)
        view.addSubview(loginButton)
    }
    
    func layoutConstraints() {
        let screenWidth = UIScreen.main.bounds.size.width
        
        idTextField.snp.makeConstraints { make in
            make.width.equalTo(screenWidth*0.8)
            make.height.equalTo(30)
            make.center.equalTo(view.snp.center)
        }
        divider.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.width.equalTo(screenWidth*0.8)
            make.top.equalTo(idTextField.snp.bottom).offset(8)
            make.centerX.equalTo(view.snp.centerX)

        }
        pwTextField.snp.makeConstraints { make in
            make.width.equalTo(screenWidth*0.8)
            make.height.equalTo(30)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(divider.snp.bottom).offset(20)
        }
        showPWImage.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.centerY.equalTo(pwTextField.snp.centerY)
            make.trailing.equalTo(pwTextField.snp.trailing)
        }
        divider2.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.width.equalTo(screenWidth*0.8)
            make.top.equalTo(pwTextField.snp.bottom).offset(8)
            make.centerX.equalTo(view.snp.centerX)

        }
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(screenWidth*0.8)
            make.height.equalTo(50)
            make.top.equalTo(divider2.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
