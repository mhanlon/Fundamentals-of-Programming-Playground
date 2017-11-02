/*:
 [Previous](@previous)
 
 **Goal:** Play time!
 Take your customized turtle for a spin!
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
import Foundation


public class TurtleViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view = TurtleView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 500))
    }
    
    public func setSpeed(_ speed: Double) {
        let view = self.view as! TurtleView
        view.speed = speed
    }
    public func addTurtle(_ turtle: Turtle) {
        let view = self.view as! TurtleView
        view.addTurtle(turtle)
        view.processCommandStack()
    }
}
//#-code-completion(everything, hide)
//#-code-completion(literal, show, "🐢", "👽", "👻", "🏃‍♀️", "🏃", "🐶", "🦋", "🐼", "🕷", "🐛", "🖍", "🗿")
//#-code-completion(description, show, "🐢", "👽", "👻", "🏃‍♀️", "🏃", "🐶", "🦋", "🐼", "🕷", "🐛", "🖍", "🗿")
//#-code-completion(identifier, show, "🐢", "👽", "👻", "🏃‍♀️", "🏃", "🐶", "🦋", "🐼", "🕷", "🐛", "🖍", "🗿")
//#-end-hidden-code

//: Let's get a turtle for our drawing.
let waffles = Turtle(name:"Waffles", avatar: "🐒")
waffles.forward(distance: 100)
waffles.right(turnDegrees: 90)
waffles.forward(distance: 100)
waffles.right(turnDegrees: 90)

waffles.setColor(color:#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
waffles.setPenSize(penSize: 4)

waffles.forward(distance: 100)
waffles.right(turnDegrees: 90)
waffles.forward(distance: 100)
waffles.home()
waffles.right(turnDegrees: 180)
waffles.forward(distance: 90)
waffles.right(turnDegrees: 45)
waffles.forward(distance: 90)
waffles.home()

for _ in 1...10 {
    waffles.forward(distance: 10)
    
    waffles.right(turnDegrees: 36)
}

//#-hidden-code
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(0.2)
vc.addTurtle(waffles)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc

//#-end-hidden-code
