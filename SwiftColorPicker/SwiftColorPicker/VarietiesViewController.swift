//
//  VarietiesViewController.swift
//  SwiftColorPicker
//
//  Created by Sean Smith on 19/3/17.
//  Copyright © 2017 Sean Smith. All rights reserved.
//
//
//  The MIT License (MIT)
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

class VarietiesViewController: UIViewController , HSBColorPickerDelegate {
    
    // View height & width
    var viewWidth   : CGFloat?
    var viewHeight  : CGFloat?
    
    // Color picker view tag
    let colorPickerViewTag : Int = 6237 // Random number - in projects with a lot of cocoa pods, people tend to use common tags such as "123" so this helps to prevent conflicts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bounds for the dimensions
        let bounds = UIScreen.main.bounds.size
        
        // Set the width and height
        viewWidth   = bounds.width
        viewHeight  = bounds.height
        
        // Add the color picker view
        self.view.addSubview(showCircleColorPicker())

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Remove from super view
        if let colorview = view.viewWithTag(colorPickerViewTag){
            colorview.removeFromSuperview()
        }
        
        // Add the color picker
        self.view.addSubview(showCircleColorPicker())
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Remove from super view
        if let colorview = view.viewWithTag(colorPickerViewTag){
            colorview.removeFromSuperview()
        }
    }
    

    func showCircleColorPicker() -> UIView {
        // Create a Frame
        let rect = CGRect(x: viewWidth! / 2 , y:  viewHeight! / 2 , width: 1.0 , height: 1.0)
        
        // Create the color picker view
        let colorview = HSBColorPicker.init(frame: rect)
        // Set the color picker delegate
        colorview.delegate = self
        // Create the border
        colorview.layer.borderColor = UIColor.white.cgColor
        colorview.layer.borderWidth = 2.0
        // Set the pixel size of the picker
        colorview.setElementSize(pixelSize: 4.0)
        // Set the picker view tag
        colorview.tag = colorPickerViewTag // Assign a tag in order to identify
        
        // Animate corner radius as animation of size adjustment occurs
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fromValue = colorview.layer.cornerRadius
        animation.toValue = self.viewWidth! / 2
        animation.duration = 0.5
        colorview.layer.add(animation, forKey: "cornerRadius")
        
        // animate into view
        UIView.animate(withDuration: 0.5, animations: {
            let newRect = CGRect(x: 0 , y:  ( self.viewHeight! / 2 ) - (self.viewWidth! / 2) , width: self.viewWidth! , height: self.viewWidth!)
            colorview.frame = newRect
            colorview.setElementSize(pixelSize: 4.0)
            // Add rounding permanently
            colorview.circleStyledView()
        }) { (finished) in
            // once finished first animation do as you like
            if finished {
                print("Finished")
            }
        }
        
        return colorview
    }
    
    // Add the HSBColorPicker delegate function
    func HSBColorColorPickerTouched(sender:HSBColorPicker, color:UIColor, point:CGPoint, state:UIGestureRecognizerState){
        // Set the background color to the selected
        self.view.backgroundColor = color
    }
}

