//
//  SetGoalViewController.swift
//  GoalKeeper-iOS
//
//  Created by 가은 on 1/13/24.
//

import UIKit

class SetGoalViewController: UIViewController, UITextViewDelegate {
    
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
    
    let textView = UITextView().then {
        $0.isScrollEnabled = false
        $0.tintColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        $0.layer.borderWidth = 0.7
        $0.textContainerInset = UIEdgeInsets(top: 25, left: 15, bottom: 25, right: 15)
    }
    
    let numberOfText = UILabel().then {
        $0.text = "0/20"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setNavigationBar()
        addView()
        layoutConstraints()
        
        buttonActions()
        
        textView.delegate = self
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
    
    func textViewDidChange(_ textView: UITextView) {
        let textCount = textView.text?.count ?? 0
        numberOfText.text = "\(textCount)/20"
    }
    
}

extension SetGoalViewController {
    func addView() {
        view.addSubview(setGoalTitle)
        view.addSubview(setGoalSubtitle)
        view.addSubview(textView)
        view.addSubview(numberOfText)
    }
    
    func layoutConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let screenWidth = UIScreen.main.bounds.size.width
        
        setGoalTitle.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(130)
            make.centerX.equalTo(view.snp.centerX)
        }
        setGoalSubtitle.snp.makeConstraints { make in
            make.top.equalTo(setGoalTitle.snp.bottom).offset(5)
            make.centerX.equalTo(view.snp.centerX)
        }
        textView.snp.makeConstraints { make in
            make.height.equalTo(170)
            make.width.equalTo(screenWidth*0.85)
            make.top.equalTo(setGoalSubtitle.snp.bottom).offset(35)
            make.centerX.equalTo(view.snp.centerX)
        }
        numberOfText.snp.makeConstraints { make in
            make.trailing.equalTo(textView.snp.trailing).offset(-20)
            make.bottom.equalTo(textView.snp.bottom).offset(-15)
        }
    }
}
