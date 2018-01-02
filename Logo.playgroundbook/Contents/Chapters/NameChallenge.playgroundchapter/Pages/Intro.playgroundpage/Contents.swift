/*:
 # Write my name
 **Goal**: Write out my name, using a turtle.
 
 We could use our turtle to draw shapes
 
 */

import PlaygroundSupport
import UIKit

let turtle1 = Turtle(name: "Waffles", avatar: "🦊")
// Write out my name
turtle1.penUp()
turtle1.west()
turtle1.forward(distance: 240)
turtle1.right(turnDegrees: 90)
turtle1.backward(distance: 200)
turtle1.penDown()
// 'M'
turtle1.forward(distance: 200)
turtle1.right(turnDegrees: 135)
turtle1.forward(distance: 75)
turtle1.left(turnDegrees: 90)
turtle1.forward(distance: 75)
turtle1.right(turnDegrees: 135)
turtle1.forward(distance: 200)

// Move to the next character
turtle1.penUp()
turtle1.left(turnDegrees: 90)
turtle1.forward(distance: 25)
turtle1.left(turnDegrees: 90)
turtle1.penDown()

// 'A'
turtle1.right(turnDegrees: 10)
turtle1.forward(distance: 200)
turtle1.right(turnDegrees: 160)
turtle1.forward(distance: 200)
// The line
// how else could i have moved here?
turtle1.right(turnDegrees: 180)
turtle1.forward(distance: 100)
turtle1.left(turnDegrees: 80)
turtle1.forward(distance: 35)
// What did we do to get back to the edge of the letter?
turtle1.backward(distance: 35)
turtle1.right(turnDegrees: 80)
turtle1.backward(distance: 100)

// Move to the next character
turtle1.penUp()
turtle1.right(turnDegrees: 100)
turtle1.forward(distance: 25)
turtle1.forward(distance: 50)
turtle1.right(turnDegrees: 270)
turtle1.penDown()

// 'T'
turtle1.forward(distance: 200)
turtle1.left(turnDegrees: 90)
turtle1.forward(distance: 50)
turtle1.backward(distance: 100)
turtle1.forward(distance: 50)
turtle1.left(turnDegrees: 90)
turtle1.forward(distance: 200)

// Move to the next character
turtle1.penUp()
turtle1.left(turnDegrees: 90)
turtle1.forward(distance: 100)
turtle1.left(turnDegrees: 90)
turtle1.penDown()

// 'T'
turtle1.forward(distance: 200)
turtle1.left(turnDegrees: 90)
turtle1.forward(distance: 50)
turtle1.backward(distance: 100)
turtle1.forward(distance: 50)
turtle1.left(turnDegrees: 90)
turtle1.forward(distance: 200)

// Which letter was hardest to draw?
// Can you write your own name?
// TODO: Use turtle heading property to turn
// FUT: talk about odd spacing of characters
// FUT: use variables to define space
// FUT: functions to repeat letters
// FUT: design your own font for one letter, how do you want the letter to look?

let vc = TurtleViewController()
vc.setSpeed(.brisk)
vc.addTurtle(turtle1)
PlaygroundPage.current.liveView = vc
