//
//  LoginViewController.swift
//  iOSAnimationSample
//
//  Created by Jake Lin on 5/17/15.
//  Copyright (c) 2015 JakeLin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var bubble1: UIImageView!
    @IBOutlet weak var bubble2: UIImageView!
    @IBOutlet weak var bubble3: UIImageView!
    @IBOutlet weak var bubble4: UIImageView!
    @IBOutlet weak var bubble5: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var dot: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var keyIcon: UIImageView!
    @IBOutlet weak var login: UIButton!
    
    // Customer UI
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    let warningMessage = UIImageView(image: UIImage(named: "Warning"))
    var loginPosition = CGPoint.zeroPoint
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bubble1.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble2.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble3.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble4.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble5.transform = CGAffineTransformMakeScale(0, 0)
        
        self.logo.center.x -= self.view.bounds.width
        self.dot.center.x -= self.view.bounds.width/2
        
        let paddingViewForUsername = UIView(frame: CGRectMake(0, 0, 44, self.username.frame.height))
        self.username.leftView = paddingViewForUsername
        self.username.leftViewMode = UITextFieldViewMode.Always
        
        let paddingViewForPassword = UIView(frame: CGRectMake(0, 0, 44, self.password.frame.height))
        self.password.leftView = paddingViewForPassword
        self.password.leftViewMode = UITextFieldViewMode.Always

        self.username.center.x -= self.view.bounds.width
        self.password.center.x -= self.view.bounds.width
        self.userIcon.center.x -= self.view.bounds.width
        self.keyIcon.center.x -= self.view.bounds.width
        
        self.login.center.x -= self.view.bounds.width
        
        spinner.startAnimating()
        spinner.alpha = 0
        self.login.addSubview(spinner)
        
        self.view.addSubview(self.warningMessage)
        self.warningMessage.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animateWithDuration(0.3, delay: 0.3, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: nil, animations: {
            self.bubble1.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble4.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble5.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.4, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: nil, animations: {
            self.bubble2.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble3.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            self.logo.center.x += self.view.bounds.width
            }, completion: nil)
        
//        UIView.animateWithDuration(0.5, delay: 0.5, options: .CurveEaseOut, animations: {
//            self.logo.center.x += self.view.bounds.width
//        }, completion: nil)
//        
        UIView.animateWithDuration(5, delay: 1, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: nil, animations: {
            self.dot.center.x += self.view.bounds.width/2
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.6, options: .CurveEaseOut, animations: {
            self.username.center.x += self.view.bounds.width
            self.userIcon.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.7, options: .CurveEaseOut, animations: {
            self.password.center.x += self.view.bounds.width
            self.keyIcon.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.8, options: .CurveEaseOut, animations: {
            self.login.center.x += self.view.bounds.width
            }, completion: { _ in
                self.loginPosition = self.login.center
        })

    }

    @IBAction func loginTapped(sender: AnyObject) {
        self.login.bounds.size.width -= 80.0
        self.spinner.center = CGPoint(x: 40.0,
            y: self.login.frame.size.height/2)
        self.spinner.alpha = 1
        
        self.warningMessage.hidden = true
        self.login.center = self.loginPosition
        self.warningMessage.center = self.login.center
        
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: nil, animations: {
                self.login.bounds.size.width += 80.0
                // self.login.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
            }, completion: {finished in
                UIView.animateWithDuration(0.5, animations: {
                    self.login.center.y += 90
                    self.spinner.alpha = 0
                })
                UIView.transitionWithView(self.warningMessage,
                    duration: 0.5,
                    options: .TransitionFlipFromTop,
                    animations: {
                        self.warningMessage.hidden = false
                }, completion: nil)
            })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
