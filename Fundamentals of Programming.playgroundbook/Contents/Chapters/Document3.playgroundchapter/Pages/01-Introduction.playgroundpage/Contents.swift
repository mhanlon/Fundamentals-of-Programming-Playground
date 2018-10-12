/*:
 **Goal:** Draw a line.
 
 It's important, for computers, to tell it to do something in a certain order.
 
 Computers, through programming languages, typically understand a limited set of specific instructions. In the case of this lesson, our computer understands one command:
 * `forward(`*some number*`)`
 
 Let's use that command to draw a line.
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let turtle = Turtle(name: "Waffles", avatar: "🐒")
/// Moves the turtle forward *n* steps
func forward(_ distance:Int) {
    turtle.forward(distance: Float(distance))
}

/// Moves the turtle forward *n* steps
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
//#-end-hidden-code

forward(/*#-editable-code*/100/*#-end-editable-code*/)

/*:
 Try changing that number `100` to some other number.
 
 **Advanced**: Try changing the `100` to some letters.
 
 What happens?
 
 Does a little red dot show up? We'll talk more about that in [a future lesson](06-Debugging).
 
 [Next](@next)
 */

//#-hidden-code
// FIXME: Don't put the letters in quotation marks, as you'll get stuck that way.

// Once you've set some commands, you need to add it to our ViewController. So let's create a view controller for our live view...
let vc = TurtleViewController()
vc.hideDegreesHelper()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(Speed.normal)
// And then add our turtle to that view controller.
vc.addTurtle(turtle)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc
//#-end-hidden-code
