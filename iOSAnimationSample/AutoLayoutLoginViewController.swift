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
  @IBOutlet var usernameConstraint: NSLayoutConstraint!
  @IBOutlet var passwordConstraint: NSLayoutConstraint!
  @IBOutlet var loginButtonConstraint: NSLayoutConstraint!
  
  
  var centerConstraintEndConstant : CGFloat = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Save all constraints end constants to animate.
    centerConstraintEndConstant = logoContraint.constant
    
    // Setup all bubbles start transform
    for bubble in bubbleImageViewGroup1 {
      bubble.transform = CGAffineTransformMakeScale(0, 0)
    }
    
    for bubble in bubbleImageViewGroup2 {
      bubble.transform = CGAffineTransformMakeScale(0, 0)
    }
    
    // Setup username and password textfields
    let paddingViewForUsername = UIView(frame: CGRectMake(0, 0, 44, usernameTextField.frame.height))
    usernameTextField.leftView = paddingViewForUsername
    usernameTextField.leftViewMode = .Always
    
    let userImageView = UIImageView(image: UIImage(named: "User"))
    userImageView.frame.origin = CGPoint(x: 13, y: 10)
    usernameTextField.addSubview(userImageView)
    
    let paddingViewForPassword = UIView(frame: CGRectMake(0, 0, 44, passwordTextField.frame.height))
    passwordTextField.leftView = paddingViewForPassword
    passwordTextField.leftViewMode = .Always
    
    let passwordImageView = UIImageView(image: UIImage(named: "Key"))
    passwordImageView.frame.origin = CGPoint(x: 12, y: 9)
    passwordTextField.addSubview(passwordImageView)
    
    
    // Set all constraints to start constants
    logoContraint.constant = centerConstraintEndConstant - view.frame.width
    usernameConstraint.constant = centerConstraintEndConstant - view.frame.width
    passwordConstraint.constant = centerConstraintEndConstant - view.frame.width
    loginButtonConstraint.constant = centerConstraintEndConstant - view.frame.width
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
    
    logoContraint.constant = centerConstraintEndConstant
    UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
        self.view.layoutIfNeeded()
    }, completion: nil)
    
    usernameConstraint.constant = centerConstraintEndConstant
    UIView.animateWithDuration(0.3, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
    
    passwordConstraint.constant = centerConstraintEndConstant
    UIView.animateWithDuration(0.3, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
    
    loginButtonConstraint.constant = centerConstraintEndConstant
    UIView.animateWithDuration(0.3, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
}
