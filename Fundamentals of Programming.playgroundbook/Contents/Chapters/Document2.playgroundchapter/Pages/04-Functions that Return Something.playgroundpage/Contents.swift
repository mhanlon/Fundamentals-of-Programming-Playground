/*:
 [Previous](@previous)
 
 **Goal:** Write a function that returns a useful value.
 
FINISHME
 */

//#-hidden-code

//#-code-completion(everything, hide)
//#-end-hidden-code

//#-editable-code

func check(animal:String) -> String {
    var checkupResult = "The " + animal + " is okay!"
    return checkupResult
}

var result = check(animal:"monkey")


// Notice how we re-use the variable 'result' here
result = check(animal:"dog")

//#-end-editable-code

/*:
 [Next](@next)
 */
