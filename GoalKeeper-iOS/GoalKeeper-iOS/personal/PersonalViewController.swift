//
//  PersonalViewController.swift
//  GoalKeeper-iOS
//
//  Created by 이지훈 on 1/12/24.
//


import UIKit

class PersonalViewController: UIViewController {
    
    
    @IBOutlet weak var goToMatchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goToMatchView.layer.cornerRadius = 12
    }
 
    
    
       
       @IBAction func gotoMatch(_ sender: Any) {
           
                let storyboard = UIStoryboard(name: "Personal", bundle: nil)
        
                guard let groupAuthVC = storyboard.instantiateViewController(withIdentifier: "SelectGoalPersonalViewController") as? SelectGoalPersonalViewController else {
        
                    print("SelectGoalPersonalViewController를 찾을 수 없습니다.")
                    return
                }
        
                self.navigationController?.pushViewController(groupAuthVC, animated: true)
        
        
        
                print(1)
           
           
       }
       
    
}
