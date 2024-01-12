//
//  ProfileViewController.swift
//  GoalKeeper-iOS
//
//  Created by 이지훈 on 1/12/24.
//

import SnapKit
import Then
import UIKit

class ProfileViewController: UIViewController {

    let myLabel = UILabel().then {
        $0.text = "MY"
        $0.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        $0.textColor = .black
    }
    
    // 닉네임
    lazy var nicknameView = arrowView(title: "골키퍼", labelFont: UIFont.systemFont(ofSize: 20, weight: .bold))
    
    // 구분선
    let divider = UIView().then {
        $0.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
    }
    let thinDivider = UIView().then {
        $0.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
    }
    let thinDivider2 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
    }
    
    lazy var badgeView = arrowView(title: "모은 배지", labelFont: UIFont.systemFont(ofSize: 18, weight: .semibold))
    lazy var agreementView = arrowView(title: "서비스 이용동의", labelFont: UIFont.systemFont(ofSize: 18, weight: .medium))
    lazy var privacyPolicyView = arrowView(title: "개인정보처리방침", labelFont: UIFont.systemFont(ofSize: 18, weight: .medium))
    lazy var inquireView = arrowView(title: "문의하기", labelFont: UIFont.systemFont(ofSize: 18, weight: .medium))
    
    let versionLabel = UILabel().then {
        $0.text = "버전정보"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        $0.textColor = .black
    }
    let version = UILabel().then {
        $0.text = "1.0.0"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        $0.textColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true

        addView()
        layoutConstraints()
        
        buttonActions()
    }
    
    func buttonActions() {
        nicknameView.addTarget(self, action: #selector(showUserInfoVC), for: .touchUpInside)
        badgeView.addTarget(self, action: #selector(showMyBadgeVC), for: .touchUpInside)
    }
    
    @objc private func showUserInfoVC(_ sender: UIView) {
        let nextVC = UserInfoViewController()
        nextVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func showMyBadgeVC(_ sender: UIView) {
        let nextVC = MyBadgeViewController()
        nextVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextVC, animated: true)
    }

    func addView() {
        view.addSubview(myLabel)
        view.addSubview(nicknameView)
        view.addSubview(divider)
        view.addSubview(badgeView)
        view.addSubview(thinDivider)
        view.addSubview(agreementView)
        view.addSubview(privacyPolicyView)
        view.addSubview(inquireView)
        view.addSubview(thinDivider2)
        view.addSubview(versionLabel)
        view.addSubview(version)
    }
    
    func layoutConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        myLabel.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(50)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
        }
        
        nicknameView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(myLabel.snp.bottom).offset(40)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        divider.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.width.equalTo(view.snp.width)
            make.top.equalTo(nicknameView.snp.bottom).offset(35)
        }
        
        badgeView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(divider.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        thinDivider.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(badgeView.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        agreementView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(thinDivider.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        privacyPolicyView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(agreementView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        inquireView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(privacyPolicyView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        thinDivider2.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(inquireView.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(thinDivider2.snp.bottom).offset(30)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
        }
        version.snp.makeConstraints { make in
            make.top.equalTo(thinDivider2.snp.bottom).offset(30)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-25)
        }
    }

}

extension ProfileViewController {
    func arrowView(title: String, labelFont: UIFont) -> UIButton {
        let arrowView = UIButton().then { $0.backgroundColor = .clear }
        
        arrowView.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        let titleLabel = UILabel().then {
            $0.text = title
            $0.font = labelFont
            $0.textColor = .black
        }
        
        let arrowImage = UIImageView().then {
            $0.image = UIImage(systemName: "chevron.right")
            $0.tintColor = .black
        }
        
        arrowView.addSubview(titleLabel)
        
        // Apply constraints using SnapKit
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.leading.equalTo(arrowView.snp.leading)
        }
        
        arrowView.addSubview(arrowImage)
        
        arrowImage.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(21)
            make.trailing.equalTo(arrowView.snp.trailing)
        }
        
        return arrowView
    }
}
