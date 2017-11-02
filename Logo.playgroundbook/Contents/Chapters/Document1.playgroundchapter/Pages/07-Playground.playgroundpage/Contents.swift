/*:
 [Previous](@previous)
 
 **Goal:** Play around!
 
 Now that we've played around with commands, use them to draw some interesting shapes.

 You can use the following commands, play around with them and see what you can make!
 * `forward(`*n*`)` - go forward *n* steps
 * `backward(`*n*`)` - go backward *n* steps
 * `right(`*n*`)` - turn right *some number* of degrees
 * `left(`*n*`)` - turn left *n* of degrees
 * `setColor(`*c*`)` - set the color of the pen
 * `penUp()` - lift the pen so it doesn't draw while we move
 * `penDown()` - put the pen back down
 * `home()` - go to the center of the screen
 * `setPenSize(`*n*`)` - Change the width of the line to *n*

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

func setColor(_ color:UIColor) {
    turtle.setColor(color:color)
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


public class TurtleViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view = TurtleView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 500))
        let turtleView = self.view as! TurtleView
        turtleView.showDegreesHelper()
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
// Once you've set some commands, you need to add it to our ViewController. So let's create a view controller for our live view...
let vc = TurtleViewController()
// : We can even set the speed at which our turtle draws our commands...
vc.setSpeed(0.4)
func setSpeed(_ speed: Double) {
    vc.setSpeed(speed)
}

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, forward(_:), right(_:), backward(_:), left(_:), setColor(_:), penUp(), penDown(), home(), setPenSize(_:), setSpeed(_:))
//#-code-completion(literal, show, .gray, .blue, .red, .green, .purple, .yellow, .orange)
//#-code-completion(keyword, show, for)
//#-end-hidden-code

//#-editable-code

//#-end-editable-code

//#-hidden-code

// And then add our turtle to that view controller.
vc.addTurtle(turtle)

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc
// We'll add the next when we add the next chapter...: [Next](@next)
//#-end-hidden-code


