//
//  SetGoalViewController.swift
//  GoalKeeper-iOS
//
//  Created by 가은 on 1/13/24.
//

import UIKit

class SetGoalViewController: UIViewController {
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .black
    }
    
    let setGoalTitle = UILabel().then {
        $0.text = "목표 설정하기"
        $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        $0.textColor = .black
    }
    
    let setGoalSubtitle = UILabel().then {
        $0.text = "나의 목표를 간단하게 한 문장으로 표현해봐요"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
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
        navigationItem.title = ""
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

extension SetGoalViewController {
    func addView() {
        view.addSubview(setGoalTitle)
        view.addSubview(setGoalSubtitle)
    }
    
    func layoutConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        setGoalTitle.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(130)
            make.centerX.equalTo(view.snp.centerX)
        }
        setGoalSubtitle.snp.makeConstraints { make in
            make.top.equalTo(setGoalTitle.snp.bottom).offset(5)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
