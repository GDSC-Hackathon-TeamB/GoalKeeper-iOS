//
//  RewardPopUp.swift
//  GoalKeeper-iOS
//
//  Created by 가은 on 1/13/24.
//

import UIKit

class RewardPopUp: UIViewController {
    // 배경 - black 투명도 30%
    let background = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    // 배경
    let popUpView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    let titleLabel = UILabel().then {
        $0.text = "배지를 얻었습니다!"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
    }
    
    let badgeImage = UIImageView().then {
        $0.image = UIImage(named: "badge1")
        $0.tintColor = .blue
    }
    
    let checkButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.tintColor = .white
        $0.backgroundColor = UIColor(red: 1, green: 0.498, blue: 0, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background color를 clear로 설정 (default: black)
        view.backgroundColor = .clear
        
        addView()
        layoutConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopUp))
        background.addGestureRecognizer(tapGesture)
        checkButton.addTarget(self, action: #selector(dismissPopUp), for: .touchUpInside)
    }
    
    // 배경 탭 시 팝업 닫기
    @objc func dismissPopUp() {
        dismiss(animated: true, completion: nil)
    }
}

extension RewardPopUp {
    func addView() {
        view.addSubview(background)
        view.addSubview(popUpView)
        popUpView.addSubview(titleLabel)
        popUpView.addSubview(badgeImage)
        popUpView.addSubview(checkButton)
    }
    
    func layoutConstraints() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        popUpView.snp.makeConstraints { make in
            make.height.equalTo(screenHeight*0.25)
            make.width.equalTo(screenWidth*0.8)
            make.center.equalTo(view.center)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(popUpView.snp.centerX)
            make.top.equalTo(popUpView.snp.top).offset(25)
        }
        badgeImage.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.centerX.equalTo(popUpView.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
        }
        checkButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(popUpView.snp.centerX)
            make.horizontalEdges.equalTo(popUpView.snp.horizontalEdges).inset(10)
            make.bottom.equalTo(popUpView.snp.bottom).offset(-10)
        }
    }
}
