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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setNavigationBar()
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "회원정보"
        let backButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButtonItem
    }
}
