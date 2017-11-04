/*:
 [Previous](@previous)
 
 **Goal:** Find and fix more squirrely bugs in a piece of code.
 
 So when the computer can help us fix our errors we're in great shape. But what happens when we make a mistake in our [logic](glossary://logic)?
 
 So how do we fix a case where we mistype something and the computer doesn't know what we're talking about?
 
 Try and fix the following lines of code. We want to draw an octagon. Can you figure out how to make this code draw an octagon?
 
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
//#-end-hidden-code

//#-editable-code
for _ in 1...6 {
    forward(50)
    right(45)
}
//#-end-editable-code

//#-hidden-code
turtle.penUp()
turtle.home()
turtle.backward(distance: 200)
turtle.penDown()
//#-end-hidden-code

/*:
 Now this one's a little more advanced.
 
 This code is also meant to draw an octagon. But something's not right. How do we fix this?
 
 Can you work out what this code would do and what you would change to get it to draw a proper octagon?
 */

//#-editable-code
for i in 1...8 {
    forward(50)
    right(55)
}
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
