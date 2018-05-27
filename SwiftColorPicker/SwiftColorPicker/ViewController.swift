//
//  ViewController.swift
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

import UIKit

class ViewController: UIViewController , HSBColorPickerDelegate {
        
    // View height & width
    var viewWidth   : CGFloat?
    var viewHeight  : CGFloat?
    
    // Color picker view tag
    let colorPickerViewTag : Int = 6723 // Random number - in projects with a lot of cocoa pods, people tend to use common tags such as "123" so this helps to prevent conflicts
    
    // Button that is going to be inserted into the display
    var button : UIButton?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Bounds for the dimensions
        let bounds = UIScreen.main.bounds.size
        
        // Set the width and height
        viewWidth   = bounds.width
        viewHeight  = bounds.height
        
        // Add new card
        addColorPickerButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Hide the collectionview and add the button to create a new images
    func addColorPickerButton(){
        
        // Create a Frame
        let rect = CGRect(x: ( viewWidth! / 4 ), y: ( viewHeight! / 2 ) - 25 , width: viewWidth! / 2 , height: 50)
        // Button
        button = UIButton.init(frame: rect)
        // Set the title
        button!.setTitle("Pick Color", for: .normal)
        // Set button border width
        button!.layer.borderWidth = 2.0
        // Set the button colors
        buttonColors()
        // Set the title font size and font
        button!.titleLabel!.font =  UIFont(name: "AppleSDGothicNeo-UltraLight", size: 35)
        // Add the button target
        button!.addTarget(self, action: #selector(showColorPicker(_:)), for: .touchDown)

        // Add the button to the main view
        self.view.addSubview(button!)
        
    }
    
    // Button title and border color set here
    func buttonColors(){
        // Set the title color
        button!.setTitleColor(getButtonColors(), for: .normal)
        
        // Set the border color - add's distinction to the button
        button!.layer.borderColor = getButtonColors().cgColor
    }
    
    // Return black or white color dependent on the background color
    func getButtonColors() -> UIColor {
        
        // If the view is light, use black
        if (self.view.backgroundColor?.isLightColor())! {
            return UIColor.black
        }
        // Otherwise use white
        return UIColor.white
    }
    
    //then make a action method :
    @objc func showColorPicker(_ sender:UIButton!) {
        // Create a Frame
        let rect = CGRect(x: 0, y: 0 , width: viewWidth! , height: viewHeight!)
        let colorview = HSBColorPicker.init(frame: rect)
        colorview.delegate = self
        colorview.tag = colorPickerViewTag // Assign a tag in order to identify

        self.view.addSubview(colorview)
    }
    
    // Add the HSBColorPicker delegate function
    func HSBColorColorPickerTouched(sender:HSBColorPicker, color:UIColor, point:CGPoint, state:UIGestureRecognizerState){
        // Set the background color to the selected
        self.view.backgroundColor = color
        
        // Set the color of the buttons accordingly
        buttonColors()
        
        // Remove the view if it shares the tag
        if let view = self.view.viewWithTag(colorPickerViewTag){
            view.removeFromSuperview()
        }
        
    }

}

