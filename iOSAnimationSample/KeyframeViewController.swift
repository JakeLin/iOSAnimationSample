//
//  KeyframeViewController.swift
//  iOSAnimationSample
//
//  Created by Jake Lin on 5/22/15.
//  Copyright (c) 2015 JakeLin. All rights reserved.
//

import UIKit

class KeyframeViewController: UIViewController {

    @IBOutlet weak var blueSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        UIView.animateWithDuration(0.5, animations: {
//           self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
//            }, completion: { _ in
//                UIView.animateWithDuration(0.5, animations: {
//                    self.blueSquare.center.y = self.view.bounds.height - self.blueSquare.center.y
//                    }, completion: { _ in
//                        UIView.animateWithDuration(0.5, animations: {
//                            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
//                            }, completion: { _ in
//                                UIView.animateWithDuration(0.5, animations: {
//                                    self.blueSquare.center.y = self.view.bounds.height - self.blueSquare.center.y
//                                }, completion: nil)
//                                
//                        })
//                })
//        })
        
        // Same as above using keyframe animation
        UIView.animateKeyframesWithDuration(2, delay: 0, options: [], animations: {
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.25, animations: {
                self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            })
            UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.25, animations: {
                self.blueSquare.center.y = self.view.bounds.height - self.blueSquare.center.y
            })
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.25, animations: {
                self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            })
            UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: {
                self.blueSquare.center.y = self.view.bounds.height - self.blueSquare.center.y
            })
        }, completion: nil)
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
