# Swift Color Picker Example
Swift Color Picker Example is a single view application that provides developers an example of how to display a color picker view over the primary view requiring use of such tool. The code is simple and has been implemented in a way that users should be able to review the code and implement in their own projects in their own ways.

![alt tag](https://github.com/AppDevGuy/SwiftColorPicker/blob/master/swift-color-picker-demo.gif)

Whether it matters to you, the reader, or not this is pretty rough. I have implemented it as a demonstration of the ease and potential of use. I will tidy up at some point.

I put this together to keep for future use in other projects and wanted to share. I also implemented a circular palette with animation which can be used with menus or other things. 

If you want to make some changes or improve, please create it on a separate branch and submit a Pull Request. Any issues, raise one. 

# Core Features
## Display Color Picker View
This view contains pixelation set to a default value of thirty. It can be adjusted to smaller or larger as required. Using `UILongPressGestureRecognizer` to detect touches at a `CGPoint` which is mapped to the color at that point. 

### Create the color picker (basic)
It's really simple to create the color picker if you include the `ColorPicker.swift` file.

```Swift
// Create a Frame
let rect = CGRect(x: 0, y: 0 , width: viewWidth! , height: viewHeight!)
// Create the color view
let colorview = HSBColorPicker.init(frame: rect)
// Set the delegate
colorview.delegate = self
// Add to the view
self.view.addSubview(colorview)
```

### Want change the the color pixel size?
This is nice and simple! You can change the pixel size after you created the color picker.

```Swift
// Set the pixel size of the picker
colorview.setElementSize(pixelSize: 4.0)
```

Adjust the value 30.0 to be smaller or greater. That's it!

I discovered this code at this answer to solve the issue: [Simple swift color picker popover (iOS)](http://stackoverflow.com/a/34142316/4008175) so head over and give some love if my demo app helps.

## Color Brightness Check
If you noticed in the gif, the button changes font and border color. This is thanks to an extension I have used to detect whether the background color is light or dark. 

I discovered this code at this answer to solve the issue: [Check if UIColor is dark or bright?](http://stackoverflow.com/a/29044899/4008175)

It returns a boolean which details whether the color is currently light or dark. In my own code I have a simple if statement that returns white or black to set the color of the button text and border.

# Additional Info
Copyright © 2017 Sean Smith. All rights reserved.

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Summary
I hope this demo helps, there are a few around but I found this method the most dynamic and easy to implement.
