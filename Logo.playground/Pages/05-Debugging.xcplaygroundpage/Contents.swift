/*:
 [Previous](@previous)
 
 **Goal:** Use a loop to make a square.
 
 Computers are excellent at doing repetitive tasks. For example, in our previous lesson, we drew a square. One way to draw a square is to go forward a certain number of steps, turn right, go forward a certain number of steps, turn right, go forward a certain number of steps, turn right, then go forward a certain number of steps. Like so:
 ```
 forward(100)
 right(90)
 forward(100)
 right(90)
 forward(100)
 right(90)
 forward(100)
 right(90)
 ```
 
 What lines are repeated? How many times are they repeated?
 
 In Swift, if we want the computer to do something 4 times we use a `for` loop. Like this:
 
 ```
 for _ in 1...4 {
 <your code here>
 }
 ```
 Try filling out the code in the loop to draw a square without repeating lines.
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let turtle = Turtle(name: "Bob", avatar: "🐒")
func forward(_ distance:Int) {
    turtle.forward(distance: Float(distance))
}

func backward(_ distance:Int) {
    turtle.backward(distance: Float(distance))
}

func right(_ degrees:Int) {
    turtle.right(turnDegrees: Float(degrees))
}

func left(_ degrees:Int) {
    turtle.left(turnDegrees: Float(degrees))
}


public class TurtleViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view = TurtleView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 500))
        let turtleView = self.view as! TurtleView
        turtleView.showDegreesHelper()
    }
    
    public func setSpeed(_ speed: Double) {
        let view = self.view as! TurtleView
        view.speed = speed
    }
    public func addTurtle(_ turtle: Turtle) {
        let view = self.view as! TurtleView
        view.addTurtle(turtle)
        view.processCommandStack()
    }
}
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, forward(_:), right(_:), backward(_:), left(_:))
//#-end-hidden-code

//for _ in 1...4 {
//    //#-editable-code
//    forward(100)
//    //#-end-editable-code
//}



//#-hidden-code

// Once you've set some commands, you need to add it to our ViewController. So let's create a view controller for our live view...
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(0.4)
// And then add our turtle to that view controller.
vc.addTurtle(turtle)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc
//#-end-hidden-code

//: [Next](@next)


