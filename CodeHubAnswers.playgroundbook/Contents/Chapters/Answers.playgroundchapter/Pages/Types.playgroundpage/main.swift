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
//#-localizable-zone(typesk1)
// 1. Ask for a date
//#-end-localizable-zone
show("/*#-localizable-zone(whatIsYourBirthdateText)*/What is your birthdate?/*#-end-localizable-zone*/")
let birthdate = askForDate("/*#-localizable-zone(birthdateText)*/Birthdate/*#-end-localizable-zone*/")

//#-localizable-zone(typesk2)
// 2. Ask for a number
//#-end-localizable-zone
show("/*#-localizable-zone(whatIsYourFavoriteNumberText)*/What is your favorite number?/*#-end-localizable-zone*/")
let number = askForNumber("/*#-localizable-zone(numberText)*/Number/*#-end-localizable-zone*/")

//#-localizable-zone(typesk3)
// 3. Ask for a choice from a set of options
//#-end-localizable-zone
show("/*#-localizable-zone(whatIsYourFavoriteColorText)*/What is your favorite color?/*#-end-localizable-zone*/")
let color = askForChoice("/*#-localizable-zone(colorText)*/Color/*#-end-localizable-zone*/", options: ["/*#-localizable-zone(blueText)*/Blue/*#-end-localizable-zone*/", "/*#-localizable-zone(greenText)*/Green/*#-end-localizable-zone*/", "/*#-localizable-zone(orangeText)*/Orange/*#-end-localizable-zone*/", "/*#-localizable-zone(purpleText)*/Purple/*#-end-localizable-zone*/", "/*#-localizable-zone(redText)*/Red/*#-end-localizable-zone*/", "/*#-localizable-zone(yellowText)*/Yellow/*#-end-localizable-zone*/"])

//#-end-editable-code
