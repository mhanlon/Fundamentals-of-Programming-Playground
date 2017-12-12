import Foundation
import UIKit

public func randomColor() -> UIColor {
    return UIColor(displayP3Red: (CGFloat(arc4random())/CGFloat(UInt32.max)), green: (CGFloat(arc4random())/CGFloat(UInt32.max)), blue: (CGFloat(arc4random())/CGFloat(UInt32.max)), alpha: 1.0)
}
