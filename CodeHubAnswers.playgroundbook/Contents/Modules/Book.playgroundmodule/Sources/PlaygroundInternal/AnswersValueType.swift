//
//  AnswersValueType.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import PlaygroundSupport

enum AnswersValueType : Equatable {
    case string
    case number
    case bool
    case decimal
    case date
    case choice([String])
}

extension AnswersValueType {
    init?(_ playgroundValue: PlaygroundValue) {
        switch playgroundValue {
        case .string("string"):
            self = .string
        case .string("number"):
            self = .number
        case .string("bool"):
            self = .bool
        case .string("decimal"):
            self = .decimal
        case .string("date"):
            self = .date
        case .array(let options):
            self = .choice(options.compactMap({ (value) -> String? in
                if case .string(let string) = value {
                    return string
                }
                else {
                    return nil
                }
            }))
        default:
            return nil
        }
    }
    
    var playgroundValue: PlaygroundValue {
        switch self {
        case .string:
            return .string("string")
        case .number:
            return .string("number")
        case .bool:
            return .string("bool")
        case .decimal:
            return .string("decimal")
        case .date:
            return .string("date")
        case .choice(let options):
            return  .array(options.map({ (string) -> PlaygroundValue in
                return .string(string)
            }))
        }
    }
}
