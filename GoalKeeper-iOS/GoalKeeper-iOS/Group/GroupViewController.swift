//
//  GroupViewController.swift
//  GoalKeeper-iOS
//
//  Created by 이지훈 on 1/12/24.
//

import UIKit

class GroupViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func gotogroupAuth(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Group", bundle: nil)
        
        guard let groupAuthVC = storyboard.instantiateViewController(withIdentifier: "GroupAuthViewController") as? GroupAuthViewController else {
            
            print("GroupAuthViewController를 찾을 수 없습니다.")
            return
        }
        
        self.navigationController?.pushViewController(groupAuthVC, animated: true)
        
        
        
        print(1)
    }
}


