//
//  AutoLayoutLoginViewController.swift
//  iOSAnimationSample
//
//  Created by Jake Lin on 10/9/15.
//  Copyright © 2015 JakeLin. All rights reserved.
//

import UIKit

class AutoLayoutLoginViewController: UIViewController {
  
  //MARK: IB outlets
  
  @IBOutlet var bubbleImageViewGroup1: [UIImageView]!
  @IBOutlet var bubbleImageViewGroup2: [UIImageView]!
  @IBOutlet var usernameTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  
  @IBOutlet var logoContraint: NSLayoutConstraint!
  
  
  var logoConstraintEndConstant : CGFloat = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Save all constraints end constants to animate.
    logoConstraintEndConstant = logoContraint.constant
    
    // Set all bubbles start transform
    for bubble in bubbleImageViewGroup1 {
      bubble.transform = CGAffineTransformMakeScale(0, 0)
    }
    
    for bubble in bubbleImageViewGroup2 {
      bubble.transform = CGAffineTransformMakeScale(0, 0)
    }
    
    // Set all constraints to start constants
    logoContraint.constant = logoConstraintEndConstant - view.frame.width
  }
  
  
  //MARK: IB actions
  
  @IBAction func startAnimation(sender: AnyObject) {
    animate()
  }
  
  
  // MARK: Private methods
  
  func animate() {
    UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
      for bubble in self.bubbleImageViewGroup1 {
        bubble.transform = CGAffineTransformMakeScale(1, 1)
      }
    }, completion: nil)
    
    UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
      for bubble in self.bubbleImageViewGroup2 {
        bubble.transform = CGAffineTransformMakeScale(1, 1)
      }
    }, completion: nil)
    
    logoContraint.constant = logoConstraintEndConstant
    UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
        self.view.layoutIfNeeded()
    }, completion: nil)
  }
}
