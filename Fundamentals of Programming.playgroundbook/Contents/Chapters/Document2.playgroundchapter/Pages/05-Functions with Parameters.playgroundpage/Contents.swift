/*:
 [Previous](@previous)
 
 **Goal:** Learn to write functions that accept multiple parameters.
 
Sometimes we'll need to pass more than one thing to our function. If I have more than one pet at home, I might want to bring them both in for a checkup at the same time.
 */

//#-hidden-code

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, check(animal1:animal2:))
//#-end-hidden-code

//#-editable-code
func check(animal1:String, animal2:String) -> String {
    var checkupResult = "The " + animal1 + " and " + animal2 + " are both okay!"
    return checkupResult
}

var result = check(animal1:"monkey", animal2:"sea otter")


// Notice how we re-use the variable 'result' here
result = checks(animal1:"dog", animal2:"cat")

result = check(animal1:"🐰", animal2:"hippo")

//#-end-editable-code

/*:
 [Next](@next)
 */
