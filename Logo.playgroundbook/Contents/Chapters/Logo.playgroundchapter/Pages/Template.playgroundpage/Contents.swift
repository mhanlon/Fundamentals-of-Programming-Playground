//: [Previous](@previous)
//#-code-completion(everything, hide)
//#-code-completion(bookauxiliarymodule, show)
//#-code-completion(identifier, show, ., forward(), backward(), left(), right(), setPenSize(), setColor(), penUp(), penDown())
import PlaygroundSupport
import UIKit

let turtle1 = Turtle(name: "Waffles", avatar: "🦊")
//#-code-completion(identifier, show, turtle1)
// Make your turtle do something interesting!



let vc = TurtleViewController()
//#-code-completion(identifier, show, vc)
vc.setSpeed(.brisk)
vc.addTurtle(turtle1)

// If you need a degrees helper, you can uncomment this code:
//vc.showDegreesHelper()
PlaygroundPage.current.liveView = vc

//: [Next](@next)
