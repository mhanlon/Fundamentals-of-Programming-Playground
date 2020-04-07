//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
//#-code-completion(identifier, hide, setupLiveView())
//#-hidden-code
import Foundation
//#-end-hidden-code
//#-editable-code Tap to enter code
//: Use the new `askForBool()` to get a boolean value back to try out an `if` statement
show("Do you want to know the answer to life, the universe, and everything?")
var doesWantToKnowTheAnswer = askForBool()

if doesWantToKnowTheAnswer {
    show("42")
}

//: Now try out an alternative message to show if the user *doesn't* want to know the answer.

//#-end-editable-code
