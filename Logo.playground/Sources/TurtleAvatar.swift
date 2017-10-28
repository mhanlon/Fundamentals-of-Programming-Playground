import UIKit

public class TurtleAvatar: UIView {
    public var heading = 0.0 // North
    public var label: UILabel?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.label = UILabel(coder:aDecoder)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.label = UILabel(frame: frame)
        //self.label?.text = "🐢"
        //self.label?.transform = CGAffineTransform(rotationAngle: (.pi / 2) )
        self.addSubview(self.label!)
    }
    
    public func setAvatar(_ avatar: String, size: Double?) {
        self.label?.text = avatar
        if let fontSize = size {
            let font = UIFont.systemFont(ofSize: CGFloat(fontSize))
            self.label?.font  = font
        }
        self.label?.sizeToFit()
    }

    
    public override func draw(_ rect: CGRect) {
        // Draw the turtle avatar based on the heading...
        if let label = self.label, let text = label.text, text.count > 0 {
        } else {
            let triangle = UIBezierPath()
            triangle.move(to: CGPoint(x: rect.width / 2, y: rect.height / 8))
            triangle.addLine(to: CGPoint(x: rect.width / 2 + (rect.width * 5 / 8 / sqrt(3.0)), y: rect.height / 4 * 3))
            triangle.addLine(to: CGPoint(x: rect.width / 2 - (rect.width * 5 / 8 / sqrt(3.0)), y: rect.height / 4 * 3))
            triangle.close()
            
            UIColor.black.setStroke()
            UIColor.white.setFill()
            triangle.fill()
            triangle.stroke()
        }
        super.draw(rect)
        
    }
}
