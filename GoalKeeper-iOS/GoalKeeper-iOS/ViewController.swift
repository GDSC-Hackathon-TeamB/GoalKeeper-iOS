//
//  ViewController.swift
//  GoalKeeper-iOS
//
//  Created by 이지훈 on 1/12/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goAction(_ sender: Any) {
        
        
    }
    
}

@IBAction func gotogroupAuth(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil) // "Main"은 스토리보드의 이름입니다. 적절하게 변경해 주세요.
    guard let groupAuthVC = storyboard.instantiateViewController(withIdentifier: "GroupAuthViewController") as? GroupAuthViewController else {
        print("GroupAuthViewController를 찾을 수 없습니다.")
        return
    }

    self.navigationController?.pushViewController(groupAuthVC, animated: true)
}
