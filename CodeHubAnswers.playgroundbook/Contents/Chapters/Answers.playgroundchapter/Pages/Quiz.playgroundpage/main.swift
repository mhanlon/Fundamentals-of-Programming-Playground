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
// Use show() and ask() to quiz your classmates
show("What is your favorite animal?")
var animal = ask()
show("Your favorite animal is a " + animal)
show("How many legs do you have?")
var numberOfLegs = askForNumber()
show("You have \(numberOfLegs) legs.")
//#-end-editable-code
