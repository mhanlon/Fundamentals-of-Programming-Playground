/*:
 [Previous](@previous)
 
 **Goal:** Find and fix a bug in a piece of code.
 
 So far we've been getting the hang of drawing lines and shapes with simple commands. But what happens when we try to tell the computer to do something it doesn't understand? Even if we do it by accident, a computer doesn't know what to do with commands other than the ones it's been taught.
 
 So how do we fix a case where we mistype something and the computer doesn't know what we're talking about?
 
 Try and fix the following line of code, using Swift Playgrounds's red dot. If you tap the red dot alongside the bug in our code you should see a suggestion about how to fix the problem.
 
 In this case, we can just tap the 'Fix' button and Swift Playgrounds will magically make the fix for us. But in other cases we need to track down the reason for why a piece of code isn't working.
 
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
goforward(100)
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


