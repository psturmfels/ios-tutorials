//
//  ViewController.swift
//  project1
//
//  Created by Pascal Sturmfels on 9/27/16.
//  Copyright © 2016 KTP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var colorTextField: UITextField!
    @IBAction func changeColorTapped(_ sender: AnyObject) {
        changeBackground()
    }
    
    func returnKeyboard() {
        colorTextField.resignFirstResponder()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        changeBackground()
        return true
    }
    
    func changeBackground() {
        if let text = colorTextField.text {
            let lowerText = text.lowercased()
            switch lowerText {
            case "blue":
                self.view.backgroundColor = UIColor.blue
            case "red":
                self.view.backgroundColor = UIColor.red
            case "black":
                self.view.backgroundColor = UIColor.black
            case "brown":
                self.view.backgroundColor = UIColor.brown
            case "cyan":
                self.view.backgroundColor = UIColor.cyan
            case "gray":
                self.view.backgroundColor = UIColor.gray
            case "green":
                self.view.backgroundColor = UIColor.green
            case "magenta":
                self.view.backgroundColor = UIColor.magenta
            case "orange":
                self.view.backgroundColor = UIColor.orange
            case "purple":
                self.view.backgroundColor = UIColor.purple
            case "white":
                self.view.backgroundColor = UIColor.white
            case "yellow":
                self.view.backgroundColor = UIColor.yellow
            default:
                let notAColorAlert = UIAlertController(title: "Not a recognized color", message: "Please enter the name of a color", preferredStyle: UIAlertControllerStyle.alert)
                notAColorAlert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(notAColorAlert, animated: true, completion: nil)
                return
            }
            returnKeyboard()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorTextField.delegate = self
        
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.returnKeyboard))
        view.addGestureRecognizer(tap)
        colorTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

