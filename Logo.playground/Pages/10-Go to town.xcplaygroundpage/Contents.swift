/*:
 [Previous](@previous)
 
 **Goal:** Play time!
 Take your customized turtle for a spin!
 */
//#-hidden-code
import UIKit
import PlaygroundSupport



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
let spot = Turtle(name:"Spot", avatar: "🐢")
spot.forward(distance: 100)
spot.right(turnDegrees: 90)
spot.forward(distance: 100)
spot.right(turnDegrees: 90)

spot.setColor(color:/*#-editable-code*/ #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)/*#-end-editable-code*/)
spot.setPenSize(penSize: 4)

spot.forward(distance: 100)
spot.right(turnDegrees: 90)
spot.forward(distance: 100)
spot.home()
spot.right(turnDegrees: 180)
spot.forward(distance: 90)
spot.right(turnDegrees: 45)
spot.forward(distance: 90)
spot.home()
//#-hidden-code
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(0.2)
vc.addTurtle(spot)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc

//#-end-hidden-code
