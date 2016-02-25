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
    var yPosition: CGFloat = 120
    var duration = 1.0
    var delay = 0.0
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
        squareView.frame = CGRect(x: 0, y: yPosition, width: squareSide, height: squareSide)
        squareView.alpha = 0.0
        self.view.addSubview(squareView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func animateSquare(sender: AnyObject) {
        self.squareView.alpha = 1.0
        if (running) {
            //Animate the square back to the starting position.
            UIView.animateWithDuration(duration, animations: { () -> Void in
                self.squareView.backgroundColor = UIColor.redColor()
                self.squareView.frame = CGRect(x: 0, y: self.yPosition, width: self.squareSide, height: self.squareSide)
            })
            self.running = false
            self.animateButton.setTitle("Animate", forState: .Normal)
        } else {
            //UIViewAnimationOptions - Combining multiple animations in Swift 2.0
            let options: UIViewAnimationOptions = [UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat, UIViewAnimationOptions.CurveEaseInOut]
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: { () -> Void in
                self.squareView.backgroundColor = UIColor.orangeColor()
                self.squareView.frame = CGRect(x: self.viewWidth - self.squareSide, y: self.yPosition, width: self.squareSide, height: self.squareSide)
                }, completion: nil)
            
            self.running = true
            self.animateButton.setTitle("Stop", forState: .Normal)
        }
        
    }

    @IBAction func randomAnimate(sender: AnyObject) {
        //Set a random size between 20.0 and 60.0
        let newSize = CGFloat(arc4random_uniform(40))+20
        //Set a random yPosition between 20.0 and 220.0
        let newYPosition = CGFloat(arc4random_uniform(200))+20
        
        //Add a new view to the frame.
        let newView = UIView()
        newView.backgroundColor = UIColor.redColor()
        newView.frame = CGRect(x: 0, y: newYPosition, width: newSize, height: newSize)
        self.view.addSubview(newView)
        
        //Animate the view.
        UIView.animateWithDuration(self.duration, animations: { () -> Void in
            newView.backgroundColor = UIColor.orangeColor()
            newView.frame = CGRect(x: self.viewWidth - newSize, y: newYPosition, width: newSize, height: newSize)
            }) { (animationFinished) -> Void in
                newView.removeFromSuperview()
        }
    }
    
    @IBAction func animateFish(sender: AnyObject) {
        for _ in 1...10 {
            //Set a random size between 50.0 and 100.0
            let newSize = CGFloat(arc4random_uniform(50))+50
            //Set a random yPosition between 20.0 and 350.0
            let newYPosition = CGFloat(arc4random_uniform(300))+20
            //Set the animation options.
            let options = UIViewAnimationOptions.CurveLinear
            //Set a random delay between 0s and 0.4s.
            let newDelay = NSTimeInterval(arc4random_uniform(400)) / 1000
            
            //Add the Fish ImageView to the frame.
            let imageView = UIImageView(image: UIImage(named: "doris_fish_blue_small"))
            imageView.frame = CGRect(x: 0 - newSize, y: newYPosition, width: newSize, height: newSize)
            self.view.addSubview(imageView)
            
            //Animate the view.
            UIView.animateWithDuration(duration, delay: newDelay, options: options, animations: { () -> Void in
                imageView.frame = CGRect(x: self.viewWidth, y: newYPosition, width: newSize, height: newSize)
                }, completion: { (animationFinished) -> Void in
                    imageView.removeFromSuperview()
            })
        }
    }
    

}

