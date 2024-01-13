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
    
    let cancelMatchingButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 1, green: 0.497, blue: 0.202, alpha: 0.7)
        $0.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        $0.setTitle("매칭취소", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    let nextButton1 = UIButton().then {
        $0.setTitle("매칭화면으로", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }

    let nextButton2 = UIButton().then {
        $0.setTitle("가기(임시)", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true

        addView()
        layoutConstraints()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        nextButton1.addTarget(self, action: #selector(showNextVC), for: .touchUpInside)
        nextButton2.addTarget(self, action: #selector(showNextVC2), for: .touchUpInside)
    }
    
    @objc func updateTime() {
        let currentTime = Date()
        
        // Calendar 인스턴스 생성
        let calendar = Calendar.current

        // 오늘의 오후 8시를 구하기 위해 DateComponents 설정
        var endTime = calendar.dateComponents([.year, .month, .day], from: currentTime)
        if endTime.hour ?? 0 >= 20 {
            // endTime을 하루 뒤의 날짜로 설정
            if let tomorrow = calendar.date(byAdding: .day, value: 1, to: currentTime) {
                endTime = calendar.dateComponents([.year, .month, .day], from: tomorrow)
            } else {
                // 실패 시에 적절한 처리를 추가
                print("날짜 계산에 실패했습니다.")
            }
        }
        endTime.hour = 20
        endTime.minute = 0
        endTime.second = 0
        
        if let end = calendar.date(from: endTime) {
            let interval = calendar.dateComponents([.hour, .minute, .second], from: currentTime, to: end)
            if let timeInterval = interval.second, let formattedDate = String(format: "%02d:%02d:%02d", interval.hour ?? 0, interval.minute ?? 0, timeInterval) as String? {
                time.text = formattedDate
            }
        }
    }
    
    @objc func showNextVC(_ sender: UIView) {
        let storyboard = UIStoryboard(name: "Group", bundle: nil)
        if let groupAuthVC = storyboard.instantiateViewController(withIdentifier: "GroupAuthViewController") as? GroupAuthViewController {
            navigationController?.pushViewController(groupAuthVC, animated: true)
        } else {
            print("GroupAuthViewController를 찾을 수 없습니다.")
        }
    }
    
    @objc func showNextVC2(_ sender: UIView) {
        let storyboard = UIStoryboard(name: "Personal", bundle: nil)
        if let groupAuthVC = storyboard.instantiateViewController(withIdentifier: "PersonalCollectionViewController") as? PersonalCollectionViewController {
            navigationController?.pushViewController(groupAuthVC, animated: true)
        } else {
            print("GroupAuthViewController를 찾을 수 없습니다.")
        }
    }
    
    deinit {
        // 타이머 정리
        timer?.invalidate()
        timer = nil
    }
}

extension ShowMatchingTimeViewController {
    func addView() {
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(time)
        view.addSubview(cancelMatchingButton)
        view.addSubview(nextButton1)
        view.addSubview(nextButton2)
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
        cancelMatchingButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.horizontalEdges.equalTo(view.snp.horizontalEdges).inset(70)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(time.snp.bottom).offset(60)
        }
        nextButton1.snp.makeConstraints { make in
            make.top.equalTo(cancelMatchingButton.snp.bottom).offset(50)
            make.leading.equalTo(safeArea.snp.leading).offset(90)
        }
        nextButton2.snp.makeConstraints { make in
            make.centerY.equalTo(nextButton1.snp.centerY)
            make.leading.equalTo(nextButton1.snp.trailing).offset(7)
        }
    }
}
