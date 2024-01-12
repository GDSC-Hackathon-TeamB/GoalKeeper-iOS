//
//  SelectGoalViewController.swift
//  GoalKeeper-iOS
//
//  Created by 이지훈 on 1/13/24.
//

import UIKit

class SelectGoalViewController: UIViewController {

    @IBOutlet weak var goToMatch: UILabel!
    
    @IBOutlet weak var gotoMa: UIView!
    
    @IBOutlet weak var volunteerView: UIView!
    
    @IBOutlet weak var donationView: UIView!
   
    private var isVolunteerSelected = false
    private var isDonationSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()

        
        volunteerView.layer.cornerRadius = 12
        
        donationView.layer.cornerRadius = 12
        
        gotoMa.layer.cornerRadius = 12
        
        
        
        
        updateMatchButtonColor()

        setupGestureRecognizers()
    }

    private func setupGestureRecognizers() {
        let volunteerTap = UITapGestureRecognizer(target: self, action: #selector(volunteerViewTapped))
        let donationTap = UITapGestureRecognizer(target: self, action: #selector(donationViewTapped))
        
        volunteerView.addGestureRecognizer(volunteerTap)
        donationView.addGestureRecognizer(donationTap)
    }

    @objc private func volunteerViewTapped() {
        isVolunteerSelected.toggle()
        isDonationSelected = false
        updateViewColors()
    }

    @objc private func donationViewTapped() {
        isDonationSelected.toggle()
        isVolunteerSelected = false
        updateViewColors()
    }

    private func updateViewColors() {
        volunteerView.backgroundColor = isVolunteerSelected ? #colorLiteral(red: 1.00, green: 0.75, blue: 0.60, alpha: 1.00) : #colorLiteral(red: 1.00, green: 0.75, blue: 0.60, alpha: 0.50)
        donationView.backgroundColor = isDonationSelected ? #colorLiteral(red: 1.00, green: 0.75, blue: 0.60, alpha: 1.00) : #colorLiteral(red: 1.00, green: 0.75, blue: 0.60, alpha: 0.50)
        
        updateMatchButtonColor()
    }

    private func updateMatchButtonColor() {
        let isAnySelected = isVolunteerSelected || isDonationSelected
        gotoMa.backgroundColor = isAnySelected ? #colorLiteral(red: 1.00, green: 0.50, blue: 0.00, alpha: 1.00) : #colorLiteral(red: 1.00, green: 0.75, blue: 0.72, alpha: 0.70)
    }

       
    @IBAction func gotoMa(_ sender: Any) {
        
        let showMatchingTimeVC = ShowMatchingTimeViewController()

            // 네비게이션 컨트롤러를 통해 ShowMatchingTimeViewController 푸시
            self.navigationController?.pushViewController(showMatchingTimeVC, animated: true)
        }
            
    
}
