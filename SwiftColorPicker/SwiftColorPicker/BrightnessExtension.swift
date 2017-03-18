//
//  BrightnessExtension.swift
//  SwiftColorPicker
//
//  Created by Sean Smith on 18/3/17.
//  Copyright © 2017 Sean Smith. All rights reserved.
//
//  The MIT License (MIT)
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

// This code has been adapated from this answer here: http://stackoverflow.com/a/29044899/4008175

import Foundation
import UIKit

extension UIColor {
    
    // Returns whether or not the color is a bright/light color
    func isLightColor() -> Bool {
        let components = self.cgColor.components
        
        // Had to separate into individual equations
        // The calculation in one whole was too complex apparently
        let cOne = ((components?[0])! * 299)
        let cTwo = ((components?[1])! * 587)
        let cThree = ((components?[2])! * 114)

        // Brightness equation
        let brightness = (cOne + cTwo + cThree) / 1000
        
        // If less than 0.5 color is considered "dark"
        if brightness < 0.5 {
            return false
        } else {
            return true
        }
    }
}
