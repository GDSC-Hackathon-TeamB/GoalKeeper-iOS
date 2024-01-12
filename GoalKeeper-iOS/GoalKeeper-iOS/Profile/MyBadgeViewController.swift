//
//  MyBadgeViewController.swift
//  GoalKeeper-iOS
//
//  Created by 가은 on 1/13/24.
//

import UIKit

class MyBadgeViewController: UIViewController {
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .black
    }
    
    let badgeNumLabel = UILabel().then {
        $0.text = "총 120개 중 4개를 모았어요"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .black
    }
    
    let badge1 = UIImageView().then {
        $0.image = UIImage(named: "badge1")
    }
    let badge2 = UIImageView().then {
        $0.image = UIImage(named: "badge2")
    }
    let badge3 = UIImageView().then {
        $0.image = UIImage(named: "badge3")
    }
    let badge4 = UIImageView().then {
        $0.image = UIImage(named: "badge4")
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
        navigationItem.title = "모은 배지"
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

extension MyBadgeViewController {
    func addView() {
        view.addSubview(badgeNumLabel)
        view.addSubview(badge1)
        view.addSubview(badge2)
        view.addSubview(badge3)
        view.addSubview(badge4)
    }
    
    func layoutConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        badgeNumLabel.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        badge1.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.leading.equalTo(safeArea.snp.leading).offset(30)
            make.top.equalTo(badgeNumLabel.snp.bottom).offset(50)
        }
        badge2.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.leading.equalTo(badge1.snp.trailing).offset(30)
            make.top.equalTo(badgeNumLabel.snp.bottom).offset(50)
        }
        badge3.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.leading.equalTo(badge2.snp.trailing).offset(30)
            make.top.equalTo(badgeNumLabel.snp.bottom).offset(50)
        }
        badge4.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.leading.equalTo(badge3.snp.trailing).offset(30)
            make.top.equalTo(badgeNumLabel.snp.bottom).offset(50)
        }
    }
}
