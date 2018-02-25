/*:
 [Previous](@previous)
 
 **Optional Goal:** Learn about variable types
 
 If a [variable](glossary://variable) is a little like a box in which you want to store something to use again later, the type of the variable amounts to the shape of the box.
 
 Certain languages, like Swift, know all about the types of variables you have, whether you tell it explicitly or not in your code (these are called [statically typed languages](glossary://statically%20typed%20language)). For our purposes, Swift can usually figure out (or infer) what type of variable we have based on our code. But in some cases, we need to give Swift a little hint.
 
 For example, if I know I want to remember your answer to the question, "What is your name?" I know that it will be a string, but maybe I haven't asked you yet. So I would declare a variable like so:
 
 `var name: String`
 
 Or if we've written a calculator we might want to have a variable in which we'll store the result of our calculation. In Swift, whole numbers are called [`Int`](glossary://Int)s
 
 `var calculatedResult: Int`
 */

var name: String
var mealsADay: Int

// Some time passes...
name = "Waffles"
mealsADay = 5

/*:
 If we try saving a value in our variable that doesn't match it's type (say a number in a string variable), Swift will tell us we can't do that:
 */

name = 5

//: In this case, if we really want to set our `name` to `5`, we can do it by enclosing the number 5 in quotation marks, like so:
name = "5"
//: But it won't be treated like a number any more, so we won't be able to use it, without some work, in our calculator app.
//: In this course we won't worry too much about variable types, but as you get further along your coding career you can look at Lesson 8 in Learn to Code 2 from Apple, which goes into variable types in more depth.

/*:
 [Next - Functions](02-Functions)[Next - Functions](03-Functions%20with%20One%20Parameter)
 */

