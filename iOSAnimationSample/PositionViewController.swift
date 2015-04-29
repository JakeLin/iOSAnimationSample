//
//  PositionViewController.swift
//  iOSAnimationSample
//
//  Created by Jake Lin on 4/29/15.
//  Copyright (c) 2015 JakeLin. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {
    @IBOutlet weak var blueSquare: UIView!
    @IBOutlet weak var redSquare: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        // <null>
        // println(self.view.actionForLayer(self.view.layer, forKey: "position"))

        UIView.animateWithDuration(1, animations: {
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            self.redSquare.center.y  = self.view.bounds.height - self.redSquare.center.y
            // <_UIViewAdditiveAnimationAction: 0x7fe17b70df30>
            // println(self.view.actionForLayer(self.view.layer, forKey: "position"))
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
