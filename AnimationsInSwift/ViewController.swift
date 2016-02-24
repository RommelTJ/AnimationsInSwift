//
//  ViewController.swift
//  AnimationsInSwift
//
//  Created by Rommel Rico on 2/24/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Animation Properties
    var squareSide: CGFloat = 50
    var viewWidth: CGFloat = 0
    var viewHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the View Height and Width
        viewWidth = self.view.frame.width
        viewHeight = self.view.frame.height
        
        //Create and add a red square.
        let square = UIView()
        square.backgroundColor = UIColor.redColor()
        square.frame = CGRect(x: 0, y: 120, width: squareSide, height: squareSide)
        self.view.addSubview(square)
        
        //Animate the square to the other side of the screen in 1 second
        /*
        UIView.animateWithDuration(1.0) { () -> Void in
            square.backgroundColor = UIColor.orangeColor()
            square.frame = CGRect(x: self.viewWidth - self.squareSide, y: 120, width: self.squareSide, height: self.squareSide)
        }
        */
        
        //UIViewAnimationOptions - Repeating the animation.
        /*
        let options = UIViewAnimationOptions.Repeat
        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: { () -> Void in
            square.backgroundColor = UIColor.orangeColor()
            square.frame = CGRect(x: self.viewWidth - self.squareSide, y: 120, width: self.squareSide, height: self.squareSide)
            }, completion: nil)
        */
        
        //UIViewAnimationOptions - Autoreversing the animation.
        let options = UIViewAnimationOptions.Autoreverse
        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: { () -> Void in
            square.backgroundColor = UIColor.orangeColor()
            square.frame = CGRect(x: self.viewWidth - self.squareSide, y: 120, width: self.squareSide, height: self.squareSide)
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

