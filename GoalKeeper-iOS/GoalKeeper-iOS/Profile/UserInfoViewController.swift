//
//  UserInfoViewController.swift
//  GoalKeeper-iOS
//
//  Created by 가은 on 1/13/24.
//

import SnapKit
import Then
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
    
    let idLabel = UILabel().then {
        $0.text = "ID"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
    }
    
    let id = UILabel().then {
        $0.text = "idid@gmail.com"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .black
    }
    
    let grayLine2 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
    }
    
    let myGoalLabel = UILabel().then {
        $0.text = "나의 다짐"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
 
    let noGoalLabel = UILabel().then {
        $0.text = "아직 다짐을 설정하지 않았어요!"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
    }
    
    let neighborGoal = UILabel().then {
        $0.text = "교육"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.backgroundColor = UIColor(red: 1, green: 0.745, blue: 0.596, alpha: 1)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.textAlignment = .center
    }
    let personalGoal = UILabel().then {
        $0.text = "운동"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.backgroundColor = UIColor(red: 1, green: 0.745, blue: 0.596, alpha: 1)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.textAlignment = .center
    }
    
    let logOutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setNavigationBar()
        addView()
        layoutConstraints()
        
        buttonActions()
        
        noGoalLabel.isHidden = true
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
        
        view.addSubview(idLabel)
        view.addSubview(id)
        view.addSubview(grayLine2)
        
        view.addSubview(myGoalLabel)
        view.addSubview(noGoalLabel)
        view.addSubview(neighborGoal)
        view.addSubview(personalGoal)
        
        view.addSubview(logOutButton)
    }
    
    func layoutConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let screenWidth = UIScreen.main.bounds.size.width
        
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
        
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(grayLine1.snp.bottom).offset(20)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
        }
        id.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(10)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
        }
        grayLine2.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.width.equalTo(view.snp.width).offset(-50)
            make.top.equalTo(id.snp.bottom).offset(8)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        myGoalLabel.snp.makeConstraints { make in
            make.top.equalTo(grayLine2.snp.top).offset(40)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
        }
        noGoalLabel.snp.makeConstraints { make in
            make.top.equalTo(myGoalLabel.snp.bottom).offset(10)
            make.leading.equalTo(safeArea.snp.leading).offset(25)
        }
        
        neighborGoal.snp.makeConstraints { make in
            make.width.height.equalTo(screenWidth*0.35)
            make.top.equalTo(myGoalLabel.snp.bottom).offset(28)
            make.leading.equalTo(safeArea.snp.leading).offset(40)
        }
        personalGoal.snp.makeConstraints { make in
            make.width.height.equalTo(screenWidth*0.35)
            make.top.equalTo(myGoalLabel.snp.bottom).offset(28)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-40)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeArea.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
