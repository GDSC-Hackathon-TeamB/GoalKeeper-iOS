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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setNavigationBar()
//        addView()
//        layoutConstraints()
        
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
