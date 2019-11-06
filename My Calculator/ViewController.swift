//
//  ViewController.swift
//  My Calculator
//
//  Created by MacStudent on 2019-11-04.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
                if performingMath == true
        {
            label.text = ""
            if sender.tag == 18 //Decimal
            {
                label.text = label.text! + String(".")
            }
            else
            {
                label.text = String(sender.tag-1)
            }
            //label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!) ?? 0.0
            performingMath = false
        }
        else{
            if sender.tag == 18 //Decimal
                
            {
                if (label.text?.contains("."))!{
                    return
                }
                label.text = label.text! + String(".")

              

            }
            else{
                label.text = label.text! +  String(sender.tag-1)
            }
            
            //label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!) ?? 0.0
            
        }
       
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!) ?? 0.0
            
            if sender.tag == 12 //Divide
            {
                label.text = "/"
                
            }
            if sender.tag == 13  //Multiply
            {
                label.text = "X"
            }
            if sender.tag == 14  //Minus
            {
                label.text = "-"
            }
            if sender.tag == 15  //Plus
            {
                label.text = "+"
                
            }
            
            if sender.tag == 17  //Percentage
            {
                label.text = "%"
                           
            }
            operation = sender.tag
            performingMath = true
        
        }
        else if sender.tag == 16 // eualsTo
        {
            if operation == 12
            {
                  label.text = String(previousNumber / numberOnScreen)
            }
            
            else if operation == 13
            {
                  label.text = String(previousNumber * numberOnScreen)
            }
            
            else if operation == 14
            {
                  label.text = String(previousNumber - numberOnScreen)
            }
            
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
                
            }
            
            else if operation == 17
            {
                label.text = String(previousNumber / 100)
                           
            }
            
            
        }
        else if sender.tag == 11 // clear
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

