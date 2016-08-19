//
//  Gradient.swift
//  Interview Broker #3
//
//  Created by Victor Chien on 8/13/16.
//  Copyright © 2016 Victor Chien. All rights reserved.
//

import UIKit

extension CAGradientLayer{
    func turquoiseLayer() -> CAGradientLayer{
        let topColor = UIColor(red: (138/255.0), green: (191/255.0), blue: (207/255.0), alpha: 1)
        let bottomColor = UIColor(red: (71/255.0), green: (120/255.0), blue: (138/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 0.8] //controls the position of the gradient. X and Y
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
        
    }
}
