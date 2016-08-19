//
//  StartupScreenViewController.swift
//  Interview Broker #3
//
//  Created by Victor Chien on 8/6/16.
//  Copyright © 2016 Victor Chien. All rights reserved.
//

import UIKit

class StartupScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = CAGradientLayer().turquoiseLayer()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
