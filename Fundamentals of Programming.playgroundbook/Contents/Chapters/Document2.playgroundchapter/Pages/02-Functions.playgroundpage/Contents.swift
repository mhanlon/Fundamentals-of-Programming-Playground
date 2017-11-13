/*:
 [Previous](@previous)
 
 **Goal:** Learn to group useful code into functions

 Can you name all the functions being called in this example code?
 
 In the comments there is an exercise for you to complete.
FINISHME
*/

//#-hidden-code
import UIKit
import PlaygroundSupport

//#-code-completion(everything, hide)
//#-end-hidden-code

func drawSquare(turtle:Turtle) {
    for num in 0...3 {
        turtle.forward(distance:50)
        turtle.right(turnDegrees:90)
    }
}

//Finish the implementation of the function drawLine() so that our
//turtle will draw a line 50 steps long
//Start by deleting the '//'s before the code below to un-comment
//our function definition

//func drawLine(turtle:Turtle) {
//    // Write your code here...
//}

// What do we need to do to draw a line with our turtle?
// Remember to keep the code for your function inside the
// {}'s (curly braces) so that Swift knows that it belongs to the same block.

var norbert = Turtle()
norbert.setColor(.purple)

drawSquare(turtle:norbert)

// How do we call our newly finished drawLine() function?

//#-hidden-code
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(Speed.normal)
// And then add our turtle to that view controller.
vc.addTurtle(turtle)

PlaygroundPage.current.liveView = vc
//#-end-hidden-code

/*:
 [Next](@next)
 */
