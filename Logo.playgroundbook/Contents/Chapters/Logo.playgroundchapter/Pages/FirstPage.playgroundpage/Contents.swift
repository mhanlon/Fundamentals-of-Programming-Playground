/*:
 # Turtles!
 A place to play with the Swift Turtle module from Wicked Pear Programming and the Fundamentals of Programming course.
 If you've completed the [Fundamentals of Programming Swift Playground Book](http://github.com/mhanlon/LogoPlayground), you can use this playground to experiment with the Turtle class to which you were introduced.
 
 Here's some sample code you can mess around with and see what sort of things you might draw or do with a "turtle."
 
 Just bear in mind, if you add a new turtle you need to add it to the view controller like the others have been added.
 
 For the explanation of the code and how it all works it's worth running through the playground book.
 */

import PlaygroundSupport
import UIKit

let turtle1 = Turtle(name: "Waffles", avatar: "🦊")
turtle1.setPenSize(penSize: 3)
turtle1.forward(distance: 50)
turtle1.right(turnDegrees: 60)
turtle1.setColor(UIColor.cyan)
turtle1.forward(distance: 50)
turtle1.right(turnDegrees: 60)
turtle1.setColor(UIColor.green)
turtle1.forward(distance: 50)
turtle1.right(turnDegrees: 60)
turtle1.setColor(UIColor.red)
turtle1.forward(distance: 50)
turtle1.right(turnDegrees: 60)
turtle1.setColor(UIColor.orange)
turtle1.forward(distance: 50)
turtle1.right(turnDegrees: 60)
turtle1.setColor(UIColor.blue)
turtle1.forward(distance: 50)

let turtle2 = Turtle(name: "Pancakes", avatar: "🐥")
turtle2.setPenSize(penSize: 2)
turtle2.penUp()
turtle2.right(turnDegrees:45)
turtle2.backward(distance: 100)
turtle2.penDown()
for _ in 1...45 {
    turtle2.setColor(randomColor())
    turtle2.forward(distance: 30)
    turtle2.right(turnDegrees: 90)
    turtle2.forward(distance: 5)
    turtle2.right(turnDegrees: 85)
    turtle2.forward(distance: 28)
}

let vc = TurtleViewController()
vc.setSpeed(.brisk)
vc.addTurtle(turtle1)
vc.addTurtle(turtle2)
PlaygroundPage.current.liveView = vc
