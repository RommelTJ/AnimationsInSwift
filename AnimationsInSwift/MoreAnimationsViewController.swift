//
//  MoreAnimationsViewController.swift
//  AnimationsInSwift
//
//  Created by Rommel Rico on 2/28/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class MoreAnimationsViewController: UIViewController {
    //Properties
    var viewWidth: CGFloat = 0
    var viewHeight: CGFloat = 0
    var containerSetup = false
    var fishSetup = false
    var fishBezierSetup = false
    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()
    let fish = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the viewWidth and Height
        viewWidth = self.view.frame.width
        viewHeight = self.view.frame.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doAnimate(sender: AnyObject) {
        if (containerSetup == false) {
            setContainerView()
            containerAnimate()
        } else {
            containerAnimate()
        }
    }

    func setContainerView() {
        //Set Container and add it to the screen.
        self.container.frame = CGRect(x: (viewWidth/2) - (200/2), y: 60, width: 200, height: 200)
        self.view.addSubview(container)
        
        //Set Red square frame. We want the blue square to have the same
        //position as the red square, so let's just reuse blueSquare.frame
        self.redSquare.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.blueSquare.frame = redSquare.frame
        
        //Set the background colors.
        self.redSquare.backgroundColor = UIColor.redColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()
        
        //Add the squares.
        self.container.addSubview(self.redSquare)
        
        //Mark as setup
        containerSetup = true
    }
    
    func containerAnimate() {
        //Create a tuple of views.
        var views : (frontView: UIView, backView: UIView)
        
        //If redSquare has a parent view (e.g it's in the container),
        //set redSquare as front, and blueSquare as back.
        //Otherwise flip the order.
        if ((self.redSquare.superview) != nil) {
            views = (frontView: self.redSquare, backView: self.blueSquare)
        } else {
            views = (frontView: self.blueSquare, backView: self.redSquare)
        }
        
        //Set a transition style.
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        //let transitionOptions = UIViewAnimationOptions.TransitionCurlDown
        //let transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
        
        //Animation
        /*
        UIView.transitionWithView(self.container, duration: 1.0, options: transitionOptions, animations: { () -> Void in
        //Remove the front object.
        views.frontView.removeFromSuperview()
        //Then Add the other object.
        self.container.addSubview(views.backView)
        }) { (finished) -> Void in
        print("Finished")
        }
        */
        UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
    }
    
    @IBAction func animateBlueFish(sender: AnyObject) {
        if (containerSetup == true) {
            //Remove the old setup.
            self.container.removeFromSuperview()
            containerSetup = false
            animateFish()
        } else {
            animateFish()
        }
    }
    
    func animateFish() {
        if (fishSetup == false) {
            setFishView()
        }
        
        //Angles in iOS are measured as radians. PI is 180 degrees, so PI * 2 = 360 degrees.
        let fullRotation = CGFloat(M_PI * 2)
        
        //Animate the fish.
        let duration = 2.0
        let delay = 0.0
        //let options = UIViewKeyframeAnimationOptions.CalculationModeLinear
        let options = UIViewKeyframeAnimationOptions.CalculationModePaced
        //Because we set it to CalculationModePaced the relative values below are ignored and paced evenly.
        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: { () -> Void in
            //Each Keyframe needs to be added here.
            //Within each keyframe, the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0.
            
            //FIRST KEYFRAME
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/3, animations: { () -> Void in
                //Start: 0.0s
                //Duration: 0.67s (2s * 1/3)
                //End: 0.67s.
                self.fish.transform = CGAffineTransformMakeRotation(1/3 * fullRotation)
            })
            
            //SECOND KEYFRAME
            UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: { () -> Void in
                //Start: 0.67s
                //Duration: 0.67s (2s * 1/3)
                //End: 1.34s.
                self.fish.transform = CGAffineTransformMakeRotation(2/3 * fullRotation)
            })
            
            //THIRD KEYFRAME
            UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: { () -> Void in
                //Start: 1.34s
                //Duration: 0.67s (2s * 1/3)
                //End: 2.0s.
                self.fish.transform = CGAffineTransformMakeRotation(3/3 * fullRotation)
            })

            }) { (success) -> Void in
                print("Finished Roating Fish... poor fishy!")
        }//end animateKeyframesWithDuration
    }//end animateFish
    
    func setFishView() {
        fish.image = UIImage(named: "doris_fish_blue_small")
        fish.frame = CGRect(x: self.viewWidth/2 - (50/2), y: 100, width: 50, height: 50)
        self.view.addSubview(fish)
        fishSetup = true
    }
    
    @IBAction func animateFishAlongBezierCurve(sender: AnyObject) {
        //Remove the old setup.
        if (containerSetup == true) {
            self.container.removeFromSuperview()
            containerSetup = false
            animateFishInCurve()
        } else if (fishSetup == true) {
            self.fish.removeFromSuperview()
            fishSetup = false
            animateFishInCurve()
        } else {
            animateFishInCurve()
        }
    }
    
    func animateFishInCurve() {
        if (fishBezierSetup == false) {
            setFishBezierView()
        }
        
        //DO STUFF
    }
    
    func setFishBezierView() {
        //Add the background
        let oceanBackground = UIImageView(image: UIImage(named: "ocean"))
        oceanBackground.contentMode = UIViewContentMode.ScaleToFill
        self.view.addSubview(oceanBackground)
        //Add the Fish
        fish.image = UIImage(named: "doris_fish_blue_small")
        fish.frame = CGRect(x: self.viewWidth/2 - (50/2), y: 100, width: 50, height: 50)
        self.view.addSubview(fish)
        fishBezierSetup = true
    }
    
}
