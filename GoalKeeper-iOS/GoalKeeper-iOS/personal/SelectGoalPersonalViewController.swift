//
//  SelectGoalPersonalViewController.swift
//  GoalKeeper-iOS
//
//  Created by 이지훈 on 1/13/24.
//

import UIKit

class SelectGoalPersonalViewController: UIViewController {
    
    @IBOutlet weak var exerciseView: UIView!
    
    @IBOutlet weak var studyView: UIView!
    
    @IBOutlet weak var readingView: UIView!
    
    @IBOutlet weak var DailyView: UIView!
    
    @IBOutlet weak var gotonext: UIView!
    
    private var selectedView: UIView?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          setupViews()
          setupGestureRecognizers()
          updateNextButtonColor()
      }

      private func setupViews() {
          exerciseView?.layer.cornerRadius = 12
          studyView?.layer.cornerRadius = 12
          readingView?.layer.cornerRadius = 12
          DailyView?.layer.cornerRadius = 12
          gotonext?.layer.cornerRadius = 12
      }

      private func setupGestureRecognizers() {
          let exerciseTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
          let studyTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
          let readingTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
          let dailyTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
          
          exerciseView?.addGestureRecognizer(exerciseTap)
          studyView?.addGestureRecognizer(studyTap)
          readingView?.addGestureRecognizer(readingTap)
          DailyView?.addGestureRecognizer(dailyTap)
      }

      @objc private func viewTapped(_ gesture: UITapGestureRecognizer) {
          if let view = gesture.view {
              selectedView?.backgroundColor = #colorLiteral(red: 1.00, green: 0.75, blue: 0.60, alpha: 0.50)
              view.backgroundColor = #colorLiteral(red: 1.00, green: 0.75, blue: 0.60, alpha: 1.00)
              selectedView = view
          }
          updateNextButtonColor()
      }

      private func updateNextButtonColor() {
          let isSelected = selectedView != nil
          gotonext?.backgroundColor = isSelected ? #colorLiteral(red: 1.00, green: 0.50, blue: 0.00, alpha: 1.00) : #colorLiteral(red: 1.00, green: 0.75, blue: 0.72, alpha: 0.70)
      }

    @IBAction func gotoNext(_ sender: Any) {
        
        let setGoalVC = SetGoalViewController()
          self.navigationController?.pushViewController(setGoalVC, animated: true)
        print(1)
      }
        
    }
    
    


