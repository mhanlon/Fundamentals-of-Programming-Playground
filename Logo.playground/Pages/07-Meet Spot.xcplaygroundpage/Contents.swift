/*:
 [Previous](@previous)
 
 **Goal:** Meet Spot
 This playground is designed to introduce you to Spot, a turtle with a pen attached, somewhat mysteriously, to its underside. Don't ask me how it got there.
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
let spot = Turtle(name:"Spot", avatar: /*#-editable-code*/"🐒"/*#-end-editable-code*/)
//: We can tell Spot to do certain things, let's send him forward, turn him right 90 degrees, and then go forward again and turn again.
spot.forward(distance: 100)
spot.right(turnDegrees: 90)
spot.forward(distance: 100)
spot.right(turnDegrees: 90)

//: We can also tell Spot to change the pen color or the background color of the whole scene. We can also change the pen width.
spot.setColor(color:/*#-editable-code*/ #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)/*#-end-editable-code*/)
spot.setPenSize(penSize: 4)

//: To see our new configuration, we can ask Spot to go forward again and finish off our square.
spot.forward(distance: 100)
spot.right(turnDegrees: 90)
spot.forward(distance: 100)
//: Once you've set some commands, you need to add it to our ViewController. So let's create a view controller for our live view...
//#-hidden-code
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(0.2)
//#-end-hidden-code
//: And then add our turtle to that view controller.
vc.addTurtle(spot)


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc
