//
//  SlideViewController.swift
//  Showcase
//
//  Created by AST-iMac-0015 on 10/27/15.
//  Copyright © 2015 AST-iMac-0015. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController, UITextFieldDelegate {
    var redColor:CGFloat = 1.0
    var greenColor:CGFloat = 1.0
    var blueColor:CGFloat = 1.0

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueValue: UITextField!
    
    @IBAction func changeRed(sender: AnyObject) {
        redColor = CGFloat(redSlider.value)
        redValue.text = String(format: "%.0f",Float(redColor*255.0))
        updateColor()
        
    }
    @IBAction func changeGreen(sender: AnyObject) {
        greenColor = CGFloat(greenSlider.value)
        greenValue.text = String(format: "%.0f",Float(greenColor*255.0))
        updateColor()

    }
    @IBAction func changeBlue(sender: AnyObject) {
        blueColor = CGFloat(blueSlider.value)
        blueValue.text = String(format: "%.0f",Float(blueColor*255.0))
        updateColor()

    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.redValue.delegate = self
        self.greenValue.delegate = self
        self.blueValue.delegate = self
        
        updateColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func updateColor() {
        self.view.backgroundColor =
            UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

