Higher Order Functions in Swift 

Higher order functions in Swift; a term you have probably heard of, maybe you have used some of them or seen them being used, but do you really know what a higher order function is?

This post is dedicated on explaining what a higher order function is, and how it differs from normal functions. Here not only you will find out the answer to that, but also you will see how you can implement your own custom higher order functions. Follow-up posts will demonstrate various commonly used and well-known built-in higher order functions in Swift.

There is just one think to understand when it comes to higher order functions. They are functions that accept other functions as arguments, or they return a function as their results. The same goes for closures as well; after all, a closure is a nameless function.

That sounds nice, but what does it really mean in practice? To get a taste, open a playground in Xcode and follow along. No matter if it’s likely or not to create your own higher order functions, the examples coming next are going to help you fully understand what those functions are.

To get started, suppose that we have the following enumeration that indicates the four basic mathematical operations:

 
enum MathOperation {
    case addition, subtraction, multiplication, division
}
 
Now, say that we want to implement a function that will be doing one thing only:

Based on a MathOperation value we will provide it with, it will be returning a function that will be performing the actual math operation between two operands.

For simplicity, let’s agree that we’ll be dealing with Double values only. The definition of that function will be this:

 
func math(operation: MathOperation) -> (Double, Double) -> Double? {
    
}
 
See the return value; (Double, Double) -> Double?. It’s the declaration of a function without a name. In an exactly similar fashion we declare closures, don’t we? The parameter values match to two operands of Double type, while the result is also a Double value. It’s marked with the ? symbol as an optional, so in case of a division with zero the program won’t crash.

Let’s add some content to the above function now, starting with the implementation of the four functions that will be calculating the result for each operation. Note that all new functions are defined inside the math(operation:) function -yes, we can do that-:

 
func math(operation: MathOperation) -> (Double, Double) -> Double? {
    func addition(_ val1: Double, _ val2: Double) -> Double { val1 + val2 }
    func subtraction(_ val1: Double, _ val2: Double) -> Double { val1 - val2 }
    func multiplication(_ val1: Double, _ val2: Double) -> Double { val1 * val2 }
    func division(_ val1: Double, _ val2: Double) -> Double? {val2 != 0 ? val1/val2 : nil}
}
 
Next, we will return the proper function from math(operation:), depending on the operation parameter value:

 
func math(operation: MathOperation) -> (Double, Double) -> Double? {
    func addition(_ val1: Double, _ val2: Double) -> Double { val1 + val2 }
    func subtraction(_ val1: Double, _ val2: Double) -> Double { val1 - val2 }
    func multiplication(_ val1: Double, _ val2: Double) -> Double { val1 * val2 }
    func division(_ val1: Double, _ val2: Double) -> Double? {val2 != 0 ? val1/val2 : nil}
    
    switch operation {
        case .addition: return addition(_:_:)
        case .subtraction: return subtraction(_:_:)
        case .multiplication: return multiplication(_:_:)
        case .division: return division(_:_:)
    }
}
 
The above is a higher order function! It returns another function as its result.

We can now use it as follows:

 
let num1: Double = 5.5
let num2: Double = 10.5
 
var operation = math(operation: .addition)
print(operation(num1, num2)!)
 
operation = math(operation: .multiplication)
print(operation(num1, num2)!)
 
The first time math(operation:) is called, it returns the addition(_:_:) function. The second time it returns the multiplication(_:_:) function, as specified by the provided argument. Print commands will show the values 16.0 and 57.75 respectively, after performing the actual math operations between the two given numbers.

Let’s implement now a function that accepts another function as argument, instead of returning one as its result. I will begin with the same four math functions that perform the basic calculations:

 
func addition(_ val1: Double, _ val2: Double) -> Double { val1 + val2 }
func subtraction(_ val1: Double, _ val2: Double) -> Double { val1 - val2 }
func multiplication(_ val1: Double, _ val2: Double) -> Double { val1 * val2 }
func division(_ val1: Double, _ val2: Double) -> Double? { val2 != 0 ? val1/val2 : nil }
 
With the above as granted, here’s the definition of the new function:

 
func performOperation(val1: Double,
                      val2: Double,
                      operation: (Double, Double) -> Double) -> Double? {
 
}
 
The first two parameter values are the two operands that will be used to calculate a result. The third parameter value, which is the most interesting part here, is a function; it expects two arguments of Double type, returning an optional Double result.

Inside its body there will be a single line only that will be calling the operation function passing the first two parameter values as arguments:

 
func performOperation(val1: Double,
                      val2: Double,
                      operation: (Double, Double) -> Double) -> Double? {
    operation(val1, val2)
}
 
The actual function that operation will be matching to, depends on the one that we will provide as argument. For example, to perform a multiplication we can call the above with the two values we want to multiply, plus the function that performs the multiplication:

 
var result = performOperation(val1: num1, val2: num2, operation: multiplication(_:_:))
print(result!)
 
To perform a subtraction:

 
result = performOperation(val1: num1, val2: num2, operation: subtraction(_:_:))
print(result!)
 
In both last two examples we provided a named function as argument. However, that’s not mandatory. We can use closures instead. The following example demonstrates how to pass a closure as an argument to the demo higher order function. In its body we calculate and return the average of the two given values:

 
result = performOperation(val1: num1, val2: num2, operation: { val1, val2 in
    (num1 + num2)/2
})
print(result!)


Now you know what we mean with the higher order functions term, and what their difference is comparing to normal functions, called first order functions. Even though the presented examples were quite simplistic, they are still good enough in order to help you get your head around that topic.
