import Foundation
import UIKit

let kDegreesHelperViewTag = 9007

public class TurtleView: UIView, CAAnimationDelegate {
    public var turtles = [Turtle]()
    public var animations:[(CALayer, CAAnimation, UIView?, CGAffineTransform?, CGPoint?)] = []
    //    public var speed = 0.00001 // For circles, especially...
    public var speed = Speed.normal
    public var degreesHelperView: UIImageView?
    var gridView: GridView?
    public var needsDegreesHelper = false // Don't show the degree helper by default
    var isShowingDegreesHelper = false
    
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
        // TODO: Add the grid view
        self.degreesHelperView = UIImageView(image: UIImage(named: "DegreesHelper.png", in: nil, compatibleWith: nil))
        self.degreesHelperView!.frame = CGRect(x: 0, y:0, width: 200, height: 200)
        self.toggleDegreesHelper()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        //        self.gridView = GridView(frame: self.frame)
        //        self.addSubview(self.gridView!)
    }
    
    public func showDegreesHelper() {
        self.addSubview(self.degreesHelperView!)
    }
    public func hideDegreesHelper() {
        self.degreesHelperView!.removeFromSuperview()
    }
    public func toggleDegreesHelper() {
        if ( self.isShowingDegreesHelper ) {
            self.hideDegreesHelper()
        } else {
            self.showDegreesHelper()
        }
        self.isShowingDegreesHelper = !self.isShowingDegreesHelper
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
        avatar.center = CGPoint(x: turtle.currentPoint.x, y: turtle.currentPoint.y )
        avatar.tag = turtle.tag!
        
        let radians = ( turtle.heading / 180.0 ) * .pi;
        avatar.transform = CGAffineTransform(rotationAngle: CGFloat(radians))
        
        self.addSubview(avatar)
    }
    
    public func processCommandStack() {
        for turtle in self.turtles {
            self.processCommandStack(turtle:turtle, shouldRunImmediately:false)
        }
        // Run the first animation and add the first layer...
        self.runNextCommand()
    }
    
    public func processCommandStack(turtle: Turtle, shouldRunImmediately:Bool) {
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
            
            var pt = startingPoint!
            if ( turtle.currentPoint != startingPoint ) {
                // We've gotten the home command... set our center point and exit early... this needs to be added as a command and instant animation
                pt = self.center
            } else {
                // Update our turtle's position based on our commands
                pt.x = pt.x + CGFloat(sin(Double(turtle.heading) * 2 * .pi / 360.0) * distance);
                pt.y = pt.y - CGFloat(cos(Double(turtle.heading) * 2 * .pi / 360.0) * distance);
            }
            var penColor = turtle.penColor
            if ( turtle.penState == .penerase ) {
                penColor = turtle.backgroundColor   // I'm not so sure this is right, maybe we need to delete old
                // paths, but maybe that's too hard (insert whiney voice)
            }
            
            // Set up the actual line our turtle will draw
            turtle.currentPoint = pt
            let path = UIBezierPath()
            path.move(to:startingPoint!)
            if ( turtle.penState != .penup/* && !isHomeCommand*/ ) {
                path.addLine(to:turtle.currentPoint)
            } else {
                path.move(to:turtle.currentPoint)
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
                let radians = ( turtle.heading * ( .pi / 180.0 ) )
                avatar = self.viewWithTag(turtle.tag!)
                if avatar != nil {
                    avatar!.layer.zPosition = .greatestFiniteMagnitude
                } else {
                    avatar = turtle.avatar
                    avatar!.tag = turtle.tag!
                    
                    self.addSubview(avatar!)
                }
                point = CGPoint(x: turtle.currentPoint.x, y: turtle.currentPoint.y )
                transform = CGAffineTransform(rotationAngle: CGFloat(radians))
            }
            self.animations.append( ( shapeLayer, strokeEndAnimation, avatar, transform, point ) )
        }
        if ( shouldRunImmediately ) {
            self.runNextCommand()
        }
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
        animation.duration = self.speed.rawValue
        layer.add(animation, forKey: "strokeEnd")
        
        // TODO: If the animation takes the element off screen should we bounce the avatar a bit and stop them?
        UIView.animate(withDuration: self.speed.rawValue, animations: {
            // Turtles need to follow the path, too...
            avatar?.transform = transform!
            avatar?.center = point!
            //
            if ( self.isShowingDegreesHelper ) {
                self.degreesHelperView!.transform = transform!
            }
        })
        
        setNeedsLayout()
    }
}

class GridView: UIView {
    var horizontalLines:[UIView] = []
    var verticalLines:[UIView] = []
    var lineWidth = 4
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.horizontalLines = self.fourLines()
        self.verticalLines = self.fourLines()
        let lines = self.horizontalLines + (self.verticalLines)
        for line in lines {
            self.addSubview(line)
        }
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        let width = self.frame.size.width
        let thirdOfWidth = ( width / 3 )
        
        for i in 0...3  {
            let horizontalLine = self.horizontalLines[i]
            let verticalLine = self.verticalLines[i]
            horizontalLine.frame = CGRect( x: 0, y: ( CGFloat(i) * thirdOfWidth ), width: width, height: 0.5 )
            var verticalRect = CGRect( x: ( CGFloat(i) * thirdOfWidth ), y: 0, width: 0.5, height: width )
            if ( i == 3 ) {
                verticalRect.origin.x = verticalRect.origin.x - 0.5
            }
            verticalLine.frame = verticalRect
        }
    }
    
    
    func fourLines() -> [UIView] {
        var lines:[UIView] = []
        for _ in 1...4 {
            let view = UIView()
            view.layer.backgroundColor = UIColor.black.cgColor
            lines.append(view)
        }
        return lines
    }
}
