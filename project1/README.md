# Tutorial 1
### Setting up
- Open Xcode.
- Create a new project (File -> New -> Project) of type Single View Application.
- Name it project1 and enter the following settings: Language: Swift, Devices: iPhone
- Uncheck all of the boxes at the bottom. Click next and save the project in a directory.

### Get the views on the storyboard
- Make sure that the Navigator and the Utilites are shown (View -> Navigators -> Show Project Navigator and View -> Utilites -> Show File Inspector)
- Click the Main.storyboard file (on the left side, in the Navigator)
- In the Utilities area, on the bottom right hand-corner of the screen, search "Button". Drag a Button object from the utilities area to the view on the storyboard. 

<img src="/readmeImages/buttonInUtilities.png">

- Double click the button and change its name to "Change Color".
- Hold control, click and drag from the button to the left edge of the view. Release, and on the gray pop-up menu select "Center Vertically in Container".
- Control drag from the button to the top of the view; release and select "Center Horizontally in Container".

<img src="/readmeImages/storyboardCenter.png">

- Select the button and then click on the triangle-shaped button in the bottom right corner of the screen. Click "Update Frames" on the pop-up menu.

<img src="/readmeImages/updateFrames.png">

- In the Utilities area, search for "Text Field". Drag a Text Field above your button.
- Center the Text Field horizontally. 
- Control drag from the Text Field to the Button and then add a "Vertical Spacing" constraint.
- Select the Text Field, and Update Frames.

### Linking the storyboard and the code
- Hide the Navigation and Utilities.
- Display the assistant editor (Venn-Diagram button on the top right corner of the screen). You should have the storyboard on the left side, and the ViewController class on the right side.
- Control drag from the textField to the line right above "viewDidLoad" in the ViewController class. 
- In the name field, enter "colorTextField". Then click Connect. 
- You have just made a variable that corresponds to the textField.
- Control drag from changeColor button to the line right below colorTextField but above viewDidLoad. Under Connection, select Action. Name the Action "changeColorTapped" and click Connect.
- You have just made a function that will be called when the button is clicked.

### Functions
- Add the following function (which changes the background color of the view) to the ViewController class above viewDidLoad and below changeColorTapped.
```swift
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
```
- Add a call to "changeBackground" in "changeColorTapped". It should look like this:
```swift
@IBAction func changeColorTapped(_ sender: AnyObject) {
        changeBackground()
}
```


### Text Field Delegation
- Change your class definition to the following:
```swift
class ViewController: UIViewController, UITextFieldDelegate {
```
- This is called conforming to the `UITextFieldDelegate` protocol. This allows us to tell when the user presses the return key.
- Add the following methods to the class:
```swift
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
```

- Change your viewDidLoad to look like the following:
```swift
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
```
