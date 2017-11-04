/*:
[Previous](@previous)
 
 **Goal:** Put together our commands to make a square.
 
 Now that we know how to draw a line and then turn, let's try putting together those two commands a few times to make a square.
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let turtle = Turtle(name: "Waffles", avatar: "🐒")
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
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, forward(_:), right(_:), backward(_:), left(_:))
//#-code-completion(literal, show, "😱")
//#-end-hidden-code

forward(/*#-editable-code*/100/*#-end-editable-code*/)
right(/*#-editable-code*/90/*#-end-editable-code*/)
forward(/*#-editable-code*/100/*#-end-editable-code*/)
//: Can you repeat that code a few more times to make a square?
//#-editable-code Tap to enter code
//#-end-editable-code


//#-hidden-code

// Once you've set some commands, you need to add it to our ViewController. So let's create a view controller for our live view...
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(Speed.normal)
// And then add our turtle to that view controller.
vc.addTurtle(turtle)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc
//#-end-hidden-code

//: [Next](@next)
