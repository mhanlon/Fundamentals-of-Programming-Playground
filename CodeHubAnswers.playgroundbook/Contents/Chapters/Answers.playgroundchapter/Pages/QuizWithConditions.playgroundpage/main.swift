//#-hidden-code
//
//  main.swift
//
//#-end-hidden-code
//#-code-completion(identifier, hide, setupLiveView())
//#-hidden-code
import Foundation
//#-end-hidden-code
//#-editable-code Tap to enter code
show("How many legs do you have?")
var numberOfLegs = askForNumber()
show("You have " + String(numberOfLegs) + " legs.")

if numberOfLegs > 2 {
    show("Really? That seems unlikely.")
} else {
    show("That sounds about right.")
}


//#-end-editable-code
