//
//  ShowMatchingTimeViewController.swift
//  GoalKeeper-iOS
//
//  Created by 가은 on 1/13/24.
//

import SnapKit
import Then
import UIKit

class ShowMatchingTimeViewController: UIViewController {
    
    let label1 = UILabel().then {
        $0.text = "오후 8시에 매칭이 완료됩니다."
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .black
    }
    let label2 = UILabel().then {
        $0.text = "매칭 완료까지 남은 시간"
        $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        $0.textColor = .black
    }
    
    let time = UILabel().then {
        $0.text = "00:00:00"
        $0.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
        $0.textColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true

        addView()
        layoutConstraints()
        
    }
    
}

extension ShowMatchingTimeViewController {
    func addView() {
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(time)
    }
    
    func layoutConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        label1.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(safeArea.snp.top).offset(230)
        }
        label2.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(label1.snp.bottom).offset(10)
        }
        time.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(label2.snp.bottom).offset(50)
        }
    }
}
