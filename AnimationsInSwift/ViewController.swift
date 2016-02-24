//
//  ViewController.swift
//  AnimationsInSwift
//
//  Created by Rommel Rico on 2/24/16.
//  Copyright © 2016 Rommel Rico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create and add a red square.
        let redSquare = UIView()
        redSquare.backgroundColor = UIColor.redColor()
        redSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        self.view.addSubview(redSquare)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

