/*:
 [Previous](@previous)
 
 **Goal:** Learn to write functions that accept multiple parameters.
 
FINISH
 */

//#-hidden-code

//#-code-completion(everything, hide)
//#-end-hidden-code

//#-editable-code
func check(animal1:String, animal2:String) -> String {
    var checkupResult = "The " + animal1 + " and " + animal2 + " are both okay!"
    return checkupResult
}

var result = check(animal1:"monkey", animal2:"sea otter")


// Notice how we re-use the variable 'result' here
result = checks(animal1:"dog", animal2:"cat")

//#-end-editable-code

/*:
 [Next](@next)
 */
