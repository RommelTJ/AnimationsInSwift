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
    var squareView: UIView!
    var running = false
    @IBOutlet weak var animateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the View Height and Width
        viewWidth = self.view.frame.width
        viewHeight = self.view.frame.height
        
        //Create and add a red square.
        squareView = UIView()
        squareView.backgroundColor = UIColor.redColor()
        squareView.frame = CGRect(x: 0, y: 120, width: squareSide, height: squareSide)
        self.view.addSubview(squareView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func animateSquare(sender: AnyObject) {
        if (running) {
            //Animate the square back to the starting position.
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.squareView.backgroundColor = UIColor.redColor()
                self.squareView.frame = CGRect(x: 0, y: 120, width: self.squareSide, height: self.squareSide)
            })
            self.running = false
            self.animateButton.setTitle("Animate", forState: .Normal)
        } else {
            //UIViewAnimationOptions - Combining multiple animations in Swift 2.0
            let options: UIViewAnimationOptions = [UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat, UIViewAnimationOptions.CurveEaseInOut]
            UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: { () -> Void in
                self.squareView.backgroundColor = UIColor.orangeColor()
                self.squareView.frame = CGRect(x: self.viewWidth - self.squareSide, y: 120, width: self.squareSide, height: self.squareSide)
                }, completion: nil)
            
            self.running = true
            self.animateButton.setTitle("Stop", forState: .Normal)
        }
        
    }


}

