//  AnswersLiveView.swift

import UIKit
import PlaygroundSupport

public func setupAnswersLiveView() {
    PlaygroundPage.current.liveView = {
        let answersViewController = AnswersViewController()
        answersViewController.view.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return answersViewController
    }()
}

// MARK: LiveView Client

class AnswersLiveViewClient : PlaygroundRemoteLiveViewProxyDelegate  {
    var responses: [String] = []
    
    init() {
    }
    
    func show(_ string: String) {
        guard Thread.isMainThread else {
            DispatchQueue.main.sync { [unowned self] in
                self.show(string)
            }
            return
        }
        
        guard let liveViewMessageHandler = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
            return
        }
        
        liveViewMessageHandler.send(AnswersCommand.show(string))
        
        let delay: TimeInterval = UIAccessibilityIsVoiceOverRunning() ? 4.0 : AnswersViewController.insertAnimationDuration / 2.0
        RunLoop.main.run(until: Date(timeIntervalSinceNow: delay))
    }
    
    func ask(forType valueType: AnswersValueType, placeholder: String) -> String {
        guard Thread.isMainThread else {
            var returnString: String = ""
            DispatchQueue.main.sync { [unowned self] in
                returnString = self.ask(forType: valueType, placeholder: placeholder)
            }
            return returnString
        }
        
        guard let liveViewMessageHandler = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
            return ""
        }
        
        liveViewMessageHandler.delegate = self
        liveViewMessageHandler.send(AnswersCommand.ask(valueType, placeholder))
        
        repeat {
            RunLoop.main.run(mode: .defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.1))
        } while responses.count == 0
        
        if UIAccessibilityIsVoiceOverRunning() {
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 1.0))
        }
        
        return responses.remove(at: 0)
    }
    
    // MARK: PlaygroundRemoteLiveViewProxyDelegate Methods
    
    func remoteLiveViewProxyConnectionClosed(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy) {
    }
    
    func remoteLiveViewProxy(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy, received message: PlaygroundValue) {
        guard let command = AnswersCommand(message) else {
            return
        }
        
        if case .submit(let string) = command {
            responses.append(string)
        }
    }
}
