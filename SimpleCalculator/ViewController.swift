//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Chethin Manage on 2020-06-17.
//  Copyright © 2020 Chethin Manage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var operationInProcess = false;
    var operation = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if operationInProcess == true{
            display.text = String(sender.tag-1)
            numberOnScreen = Double(display.text!)!
            operationInProcess = false;
            
        }else{
            display.text = display.text! + String(sender.tag-1)
            numberOnScreen = Double(display.text!)!
        }
        
        
    }
    
    
    
    @IBAction func functions(_ sender: UIButton) {
        
        if display.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousNumber = Double( display.text!)!
            
            if sender.tag == 12{ //divide
                display.text = "/";
            }
            
            if sender.tag == 13{ //multiply
                display.text = "*";
            }
            
            if sender.tag == 14{ //subtract
                display.text = "-";
            }
            
            if sender.tag == 15{ //add
                display.text = "+";
            }
            
            operation = sender.tag
            operationInProcess = true;
        }
        
        else if sender.tag == 11{ //if user presses equal
            if operation == 12{ //division
                display.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{ //multiplication
                display.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14{ //subtraction
                display.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{ //addition
                 display.text = String(previousNumber + numberOnScreen)
            }
        }
        
        else if sender.tag == 16{ // if user presses clear
            display.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
        }
    }
    
    
    

}

