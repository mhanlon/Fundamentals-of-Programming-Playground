//  AnswersValueType.swift

import PlaygroundSupport

enum AnswersValueType {
    case string // Yes, I know I've sort of neutered the Answers.playgroundbook code.
                // The idea is to simplify, for the moment.
}

extension AnswersValueType {
    init?(_ playgroundValue: PlaygroundValue) {
        switch playgroundValue {
        case .string("string"):
            self = .string
        default:
            return nil
        }
    }
    
    var playgroundValue: PlaygroundValue {
        switch self {
        case .string:
            return .string("string")
        default:
            return .string("")
        }
    }
}
