//
//  LiveView.swift

import UIKit

import PlaygroundSupport

let vc: TurtleViewController = TurtleViewController()
vc.showDegreesHelper()
PlaygroundPage.current.liveView = vc
