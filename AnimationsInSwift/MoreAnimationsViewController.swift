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
    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the viewWidth and Height
        viewWidth = self.view.frame.width
        viewHeight = self.view.frame.height
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doAnimate(sender: AnyObject) {
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
        //let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        //let transitionOptions = UIViewAnimationOptions.TransitionCurlDown
        let transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
        
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

}
