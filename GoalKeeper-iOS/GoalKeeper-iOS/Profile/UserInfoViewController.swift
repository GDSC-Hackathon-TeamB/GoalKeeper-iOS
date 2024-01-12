//
//  UserInfoViewController.swift
//  GoalKeeper-iOS
//
//  Created by 가은 on 1/13/24.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .black
    }
    
    let nicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
    }
    
    let nickname = UILabel().then {
        $0.text = "nicknick"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .black
    }
    
    let grayLine1 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setNavigationBar()
        addView()
        layoutConstraints()
        
        buttonActions()
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "회원정보"
        let backButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButtonItem
    }
    
    func buttonActions() {
        backButton.addTarget(self, action: #selector(didClickBackButton), for: .touchUpInside)
    }
    
    @objc func didClickBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension UserInfoViewController {
    func addView() {
        view.addSubview(nicknameLabel)
        view.addSubview(nickname)
        view.addSubview(grayLine1)
    }
    
    func layoutConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(40)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
        }
        nickname.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(10)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
        }
        grayLine1.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(nickname.snp.bottom).offset(8)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
