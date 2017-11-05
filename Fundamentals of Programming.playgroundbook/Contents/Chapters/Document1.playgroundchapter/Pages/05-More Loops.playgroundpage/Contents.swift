/*:
 [Previous](@previous)
 
 **Goal:** Determine what a piece of code will draw before running it
 
 We've just drawn a square with a loop, but can you guess what the following bit of code will draw before you run it? Use your notebook to draw what you think it will look like once it's been run.
 
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
for _ in 1...15 {
    forward(50)
    right(90)
    forward(5)
    right(90)
    forward(90)
    right(12)
}
//#-end-editable-code


//#-hidden-code

// Once you've set some commands, you need to add it to our ViewController. So let's create a view controller for our live view...
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(Speed.brisk)
// And then add our turtle to that view controller.
vc.addTurtle(turtle)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc
//#-end-hidden-code

//: [Next](@next)


