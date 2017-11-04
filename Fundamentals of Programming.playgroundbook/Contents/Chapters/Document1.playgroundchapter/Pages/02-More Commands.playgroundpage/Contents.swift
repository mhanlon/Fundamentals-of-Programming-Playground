/*:
[Previous](@previous)
 
 **Goal:** Learn some more commands.
 
 One command all on its own isn't too exciting, so let's add a few more. Our code can now call three more commands:
 * `forward(`*some number*`)`
 * `backward(`*some number*`)`
 * `right(`*some number*`)`
 * `left(`*some number*`)`
 
 Let's draw a line.
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
//#-end-hidden-code

forward(/*#-editable-code*/100/*#-end-editable-code*/)
//: And then we can turn right, in degrees.
right(/*#-editable-code*/90/*#-end-editable-code*/)
//: And go forward 100 steps again.
forward(/*#-editable-code*/100/*#-end-editable-code*/)

/*:
 Because we turned 90 degrees, when we draw a line forward again it angles away from our first line.

[Next](@next)
*/

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
