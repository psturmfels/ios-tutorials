//
//  ViewController.swift
//  project1
//
//  Created by Pascal Sturmfels on 9/27/16.
//  Copyright © 2016 KTP. All rights reserved.
//

import UIKit

/*This class is a subclass of UIViewController.
  ViewControllers manage views (text labels, buttons, photos etc.), which are the things you see on
  your phone when you use an app.
  
  It also conforms to the UITextFieldDelegate Protocol. A Protocol is essentially
  an agreement that a class, such as this one, will implement certain functions. 
  In return for implementing those functions, the class gets to have
  control over certain aspects of code.
  
  ViewController implements the TextFieldDelegate methods
  so that it can control events related to textFields –
  a textField is a singe-line box in which a user can input text.
*/
class ViewController: UIViewController, UITextFieldDelegate {
    
    //An IBOutlet variable is a variable that is made in the storyboard,
    //and is linked to code.
    @IBOutlet weak var colorTextField: UITextField!
    
    //An IBAction function is a method that is linked to a view in the storyboard,
    //and is called when that view is interacted with in the appropriate way.
    @IBAction func changeColorTapped(_ sender: AnyObject) {
        changeBackground()
    }
    
    func returnKeyboard() {
        //resignFirstResponder means that this view is no longer in focus. 
        //For text-input views like textField, this means to stop editing
        //and dismiss the keyboard
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
                //Display an alert message.
                let notAColorAlert = UIAlertController(title: "Not a recognized color", message: "Please enter the name of a color", preferredStyle: UIAlertControllerStyle.alert)
                notAColorAlert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
                
                //If you want to present a viewController over the current viewController, 
                //as in a transition, or an alert, 
                //present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil)
                //is the canonical way to do so
                self.present(notAColorAlert, animated: true, completion: nil)
                return
            }
            returnKeyboard()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //What the heck is a delegate?
        //Basically, a delegate is a manager. When an event happens to the colorTextField
        //that needs a response (for example if a user starts editing the text in the textField)
        //colorTextField tells its delegate: "Hey, someone started editing my text! Do something about it."
        colorTextField.delegate = self
        
        
        //A gesture recognizer recognizes gestures that the user makes on the phone.
        //Gestures include: Single/Multi-touch taps, directional swipes, pinches, etc.
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.returnKeyboard))
        view.addGestureRecognizer(tap)
        
        //We want the textField to initially be the first responder so that it is being edited when
        //the view is first shown.
        colorTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

