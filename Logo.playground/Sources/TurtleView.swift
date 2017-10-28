import Foundation
import UIKit

public class TurtleView: UIView, CAAnimationDelegate {
    public var turtles = [Turtle]()
    public var animations:[(CALayer, CAAnimation, UIView?, CGAffineTransform?, CGPoint?)] = []
//    public var speed = 0.00001 // For circles, especially...
    public var speed = 0.1
    
    public func addTurtle(_ turtle:Turtle) {
        turtle.currentPoint = self.center
        // No need to set the heading, which is set by default inside the turtle,
        // but we need to position it at 'home' in the center.
        turtle.tag = self.turtles.count+1
        self.turtles.append(turtle)
        // Add the TurtleAvatar to the view.
        self.positionAvatarForTurtle(turtle:turtle)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    // The view will, when drawing the view, query the turtles for their command stacks.
    // This may cause un-Logo-like behavior, as we will process each turtle in our list
    // as they've been added, and process all their commands, rather than processing each
    // command as it had been added in the code (eg.
    // * bob.forward(10)
    // * sally.right(90)
    // * sally.forward(98)
    // * bob.right(45)
    // * bob.forward(4))
    // so lines you might expect to be in front of another might not be.
    public override func draw(_ rect: CGRect) {
        // TODO: Draw a grid view?
                
        super.draw(rect)
    }
    func positionAvatarForTurtle(turtle: Turtle) {
        let avatar = turtle.avatar
        avatar.frame.origin = CGPoint(x: ( turtle.currentPoint.x - ( avatar.frame.size.width / 2 )), y: ( turtle.currentPoint.y - ( avatar.frame.size.height / 2 )))
        avatar.tag = turtle.tag!

        let radians = ( turtle.heading / 180.0 ) * .pi;
        avatar.transform = CGAffineTransform(rotationAngle: CGFloat(radians))

        self.addSubview(avatar)
    }
    
    public func processCommandStack() {
        for turtle in self.turtles {
            // Dequeue the commands from our turtles and start drawing them
            let commandStack = turtle.commandStack
            for command in commandStack {
                let startingPoint = turtle.currentPoint
                var distance = 0.0
                switch command {
                case .forward(let dist):
                    distance = Double(dist)
                case .backward(let dist):
                    distance = -Double(dist)
                case .east:
                    turtle.heading = 90.0
                case .west:
                    turtle.heading = 270.0
                case .north:
                    turtle.heading = 0.0
                case .south:
                    turtle.heading = 180.0
                case .left(let degrees):
                    turtle.heading = ( turtle.heading - degrees )
                case .right(let degrees):
                    turtle.heading = ( turtle.heading + degrees )
                case .home:
                    turtle.currentPoint = self.center
                    turtle.heading = 0.0
                case .setcolor(let color):
                    turtle.penColor = color
                case .setbg(let color):
                    turtle.backgroundColor = color
                case .setpensize(let size):
                    turtle.penSize = size
                case .penup:
                    turtle.penState = .penup
                case .pendown:
                    turtle.penState = .pendown
                case .penerase:
                    turtle.penState = .penerase
                case .show:
                    turtle.isTurtleVisible = true
                case .hide:
                    turtle.isTurtleVisible = false
                }
                
                if ( turtle.currentPoint != startingPoint ) {
                    // We've gotten the home command... set our center point and exit early... this needs to be added as a command and instant animation
                }
                // Update our turtle's position based on our commands
                var pt = startingPoint!
                pt.x = pt.x + CGFloat(sin(Double(turtle.heading) * 2 * .pi / 360.0) * distance);
                pt.y = pt.y - CGFloat(cos(Double(turtle.heading) * 2 * .pi / 360.0) * distance);
                
                var penColor = turtle.penColor
                if ( turtle.penState == .penerase ) {
                    penColor = turtle.backgroundColor   // I'm not so sure this is right, maybe we need to delete old
                    // paths, but maybe that's too hard (insert whiney voice)
                }
                
                // Set up the actual line our turtle will draw
                turtle.currentPoint = pt
                let path = UIBezierPath()
                path.move(to:startingPoint!)
                if ( turtle.penState != .penup ) {
                    path.addLine(to:turtle.currentPoint)
                }
                let shapeLayer = CAShapeLayer()
                shapeLayer.frame = self.layer.bounds
                shapeLayer.path = path.cgPath
                shapeLayer.strokeColor = penColor?.cgColor
                shapeLayer.lineWidth = CGFloat(turtle.penSize)
                shapeLayer.lineJoin = "round"
                shapeLayer.lineCap = "round"
                let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
                strokeEndAnimation.fromValue = 0.0
                strokeEndAnimation.isRemovedOnCompletion = true
                strokeEndAnimation.delegate = self
                
                // Now set up the animation for our turtle avatar to follow our stroke animation
                var avatar: UIView?
                var transform: CGAffineTransform?
                var point: CGPoint?
                if ( turtle.isTurtleVisible ) {
                    let radians = ( turtle.heading / 180.0 ) * .pi;
                    avatar = self.viewWithTag(turtle.tag!)
                    if avatar != nil {
                        point = CGPoint(x: ( turtle.currentPoint.x - ( avatar!.frame.size.width / 2 )), y: ( turtle.currentPoint.y - ( avatar!.frame.size.height / 2 )))
                        avatar!.layer.zPosition = .greatestFiniteMagnitude
                    } else {
                        avatar = turtle.avatar
                        point = CGPoint(x: ( turtle.currentPoint.x - ( avatar!.frame.size.width / 2 )), y: ( turtle.currentPoint.y - ( avatar!.frame.size.height / 2 )))
                        avatar!.tag = turtle.tag!
                        
                        self.addSubview(avatar!)
                    }
                    transform = CGAffineTransform(rotationAngle: CGFloat(radians))
                }
                self.animations.append( ( shapeLayer, strokeEndAnimation, avatar, transform, point ) )

            }
        }
        // Run the first animation and add the first layer...
        self.runNextCommand()
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        // Pop the next command off the stack to draw it...
        self.runNextCommand()
    }
    
    func runNextCommand() {
        if ( self.animations.count == 0 ) {
            return
        }
        let (layer, animation, avatar, transform, point) = self.animations.removeFirst()
        self.layer.addSublayer(layer)
        animation.duration = self.speed
        layer.add(animation, forKey: "strokeEnd")
        
        UIView.animate(withDuration: self.speed, animations: {
            // Turtles need to follow the path, too...
            avatar?.transform = transform!
            avatar?.frame.origin = point!
        })

        setNeedsLayout()
    }
}


