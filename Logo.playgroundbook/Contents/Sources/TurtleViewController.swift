import UIKit
import PlaygroundSupport

public class TurtleViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view = TurtleView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 500))
        let turtleView = self.view as! TurtleView
        turtleView.showDegreesHelper()
    }
    
    public func setSpeed(_ speed: Speed) {
        let view = self.view as! TurtleView
        view.speed = speed
    }
    public func addTurtle(_ turtle: Turtle) {
        let view = self.view as! TurtleView
        view.addTurtle(turtle)
        view.processCommandStack(turtle:turtle, shouldRunImmediately:true)
    }
    
    public func showDegreesHelper() {
        let turtleView = self.view as! TurtleView
        turtleView.showDegreesHelper()
    }

    public func hideDegreesHelper() {
        let turtleView = self.view as! TurtleView
        turtleView.hideDegreesHelper()
    }

    public func toggleDegreesHelper() {
        let turtleView = self.view as! TurtleView
        turtleView.toggleDegreesHelper()
    }
}
