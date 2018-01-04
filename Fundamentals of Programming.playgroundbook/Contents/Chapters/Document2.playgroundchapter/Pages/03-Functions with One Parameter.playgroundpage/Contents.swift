/*:
 [Previous](@previous)
 
 **Goal:** Learn what a parameter is

 [Parameter](glossary://parameter)s are values that we can pass in to a function so that we can get even more re-use out of our code.
 
 We've been using parameters already for functions like `forward(<number of steps>)`.

 We're going to add a [named parameter](glossary://named%20parameter) to our `drawSquare()` function so that we can make our square of different lengths. We have to tell our function (and coders who use it) what kind of data we expect to get passed in so we can make good use of it.
 
For the moment, we'll concentrate on two types of variables, `String`s and `Int`s (words/text and numbers), but if you want more in-depth exploration of types you can [play around a little bit](03-Variable%20Types).
*/

//#-hidden-code
import PlaygroundSupport
import UIKit
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

func setColor(_ color:UIColor) {
    turtle.setColor(color)
}

func penUp() {
    turtle.penUp()
}

func penDown() {
    turtle.penDown()
}
func home() {
    turtle.home()
}

func setPenSize(_ penSize: Int) {
    turtle.setPenSize(penSize:Float(penSize))
}

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, forward(_:), right(_:), drawThinLine(), backward(_:), left(_:), setColor(_:), penUp(), penDown(), home(), setPenSize(_:), setSpeed(_:), hideDegreesHelper(), showDegreesHelper(), for, randomColor(), Speed.fast, Speed.slow, Speed.superFast, randomColor())
//#-code-completion(literal, show, Speed.slow, Speed.normal, Speed.fast, Speed.superfast)
//#-code-completion(keyword, for)
//#-end-hidden-code
func drawThinLine(length: Int) {
    // Set our pen size to super-thin before drawing the line
    setPenSize(1)
    forward(length)
}
// We would call this like so (un-comment the next line to see it in action):

//#-editable-code
//drawThinLine(length:150)
//#-end-editable-code
/*:
 Finish the implementation of the function `drawSquare(length:Int)` so that our
turtle will draw a square with sides of varying length.
 
*/
//#-editable-code
func drawSquare(length:Int) {
    //for num in 1...4 {
        // Write some code here
    //}
}
//#-end-editable-code

/*:
 What do we need to do to draw a square with our turtle?
 How do we call our newly finished `drawSquare()` function?
 */
//#-code-completion(identifier, show, drawSquare())
//#-editable-code Tap to enter code
//#-end-editable-code

/*:
 Now we can use this `drawSquare(length:)` function here instead of having to re-write this code every time we want to draw a square.
 */
//#-hidden-code
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(Speed.normal)
// And then add our turtle to that view controller.
vc.addTurtle(turtle)
vc.hideDegreesHelper()
PlaygroundPage.current.liveView = vc
//#-end-hidden-code
/*:
 [Next](@next)
 */
