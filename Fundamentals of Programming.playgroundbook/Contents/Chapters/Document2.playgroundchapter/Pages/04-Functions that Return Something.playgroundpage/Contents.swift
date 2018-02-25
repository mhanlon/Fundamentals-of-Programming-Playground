/*:
 [Previous](@previous)
 
 **Goal:** Write a function that returns a useful value.
 
Functions start to get *really* useful when we can ask them to perform some operations and get a result back.
 
 Below we have a new function for our burgeoning veterinary business that will check an animal we pass in.
 
 Try acting as our vet-in-training and check a few animals.
 */

//#-hidden-code

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, check(animal:))
//#-end-hidden-code

//#-editable-code

func check(animal:String) -> String {
    var checkupResult = "The " + animal + " is okay!"
    return checkupResult
}

var result = check(animal:"monkey")


// Notice how we re-use the variable 'result' here
result = check(animal:"dog")

result = check(animal:"🐰")
//#-end-editable-code

/*:
 What if we change the code inside the `check(animal:)` function? Instead of saying the animal is okay, what if we wanted to hedge our bets and say the animal is 'probably okay'? How would we do that?
 
 When you're ready, act as our head vet and change the code inside the function that gets run when we check on animals.
 */

/*:
 [Next](@next)
 */
