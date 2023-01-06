The Swift team was thorough when building it Arrays. There are a plethora of methods given to us for free to use. I recently wrote an article called Swift Arrays are powerful. In it I talk about how we can better use array methods in our code to be more expressive and precise. After going through the documentation, I felt it would be beneficial to walk through some of the methods available.

In this article, I want to go through many of those methods to show the variety of things given to us for free. As you learn about all of these methods, you’ll start to appreciate Swift Arrays more and use them in more creative ways.

Creating an Array
Ever needed to instantiate an array with the same element a certain amount of times? Swift Arrays have an initializer that allows repeating the number based on the count which does the work for you.

Instead of writing something like this:

var someArray = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
You can write something like this:

var repeatingArray = Array(repeating: 10, count: 10)
someArray // [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
repeatingArray // [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
But it also works with custom data types.

struct Bus {
  let numSeats: Int
}
Array(repeating: Bus(numSeats: 10), count: 10)
Accessing Elements
Many of us know about getting the first element of an Array by using “first”.

var arr = [3, 5, 6, 9, 2, 33, 77, 55]
let firstElement = arr.first
firstElement // 3
But what if you were looking for the first element that matched a given predicate? Let’s say I needed to find the first element that is an even number. The common answer to solve this might be to use a for-loop with an if statement to check if the value at the given index is an even number. However, there’s a better way. Just use `func first(where predicate: (Self.Element) throws -> Bool) rethrows -> Self.Element?`.

let firstEvenElement = arr.first { value in
  value % 2 == 0
}
firstEvenElement // 6
We can do the same thing with the `last` property. If we wanted to find the last value that is an even number then we just use: `func last(where predicate: (Self.Element) throws -> Bool) rethrows -> Self.Element?`

let lastElement = arr.last
lastElement // 55
let lastEventElement = arr.last { value in
  value % 2 == 0
}
lastEventElement // 2
Adding Elements
Ever need to swap out a range of values with something else?

var arr = [3, 5, 6, 9, 2, 33, 77, 55]
let range = 2...5
arr.replaceSubrange(range, with: [1,2,3])
arr // [3, 5, 1, 2, 3, 77, 55]
Combining Arrays
When combining arrays, it’s common to use the `append(contentsOf:)` method like so:

var arr = [3, 5, 6, 9, 2, 33, 77, 55]
var arrToBeAdded = [1, 2, 3]
arr.append(contentsOf: arrToBeAdded)
This reads well and is sufficient for readable code. However, there’s an even cleaner way to do this.

let combineArray = arr + arrToBeAdded
Want to add the array in place?

arr += arrToBeAdded
Removing Elements
Removing elements at a certain index is easy. How else can we remove items?

var arr = [3, 5, 6, 9, 2, 33, 77, 55]
let firstElement = arr.removeFirst()
firstElement // 3
arr // [5, 6, 9, 2, 33, 77, 55]
You can do it for the last item too.

let lastElement = arr.removeLast()
lastElement // 55
arr // [5, 6, 9, 2, 33, 77]
How about removing the first three items?

arr.removeFirst(3)
arr // [2, 33, 77]
Or removing the last two?

arr.removeLast(2)
arr // 2
What if you wanted to remove all of the items based on a predicate?

var arr = [3, 5, 6, 9, 2, 33, 77, 55]
arr.removeAll { value in
  value % 2 == 1
}
arr // [6, 2]
I love how this method reads: Remove all items where this predicate is true. It’s concise and readable.

Finding Elements
Finding elements is a common task. A popular method to use is `func contains(where predicate: (Self.Element) throws -> Bool) rethrows -> Bool`.

var arr = [6, 4, 9, 10, 29, 99, 3, 6]
let containsEvenNumbers = arr.contains { value in
  value % 2 == 0
}
containsEvenNumbers // true
What if you wanted to confirm that all the elements in your array matched a certain predicate. Just use `func allSatisfy(_ predicate: (Self.Element) throws -> Bool) rethrows -> Bool`.

let allEventNumbers = arr.allSatisfy { value in
  value % 2 == 0
}
allEventNumbers // false
Need the min or max value of the array?

let minimumElement = arr.min()
minimumElement // 2
let maximumElement = arr.max()
maximumElement // 99
The min and max methods even offer a predicate closure argument so that you can do this for more complex data types.

Selecting Elements
Some times we’ll need to select elements in an array. Let’s start with this array:

var arr = [2, 6, 4, 9, 10, 29, 99, 3, 6]
It’s easy to grab the first three elements in the array or through a certain number of elements.

let firstThreeElements = arr.prefix(3)
firstThreeElements // [2, 6, 4]
let firstFourElements = arr.prefix(through: 3)
firstFourElements // [2, 6, 4, 9]
Need to grab the last three elements?

let lastThreeElements = arr.suffix(3)
lastThreeElements // [99, 3, 6]
let arrayFromThirdElement = arr.suffix(from: 3)
arrayFromThirdElement // [9, 10, 29, 99, 3, 6]
Excluding Elements
Excluding elements is a common procedure with arrays. Let’s start with this array:

var arr = [2, 6, 4, 9, 10, 29, 99, 3, 6]
This method returns an new array that drops the first element of the original array.

let arrayWithoutFirstElement = arr.dropFirst()
arrayWithoutFirstElement // [6, 4, 9, 10, 29, 99, 3, 6]
This method returns a the same array minus the first three elements.

let arrayWithoutFirstThreeElements = arr.dropFirst(3)
arrayWithoutFirstThreeElements // [9, 10, 29, 99, 3, 6]
The `drop` method allows you to drop all the elements that match this predicate until you reach an element that doesn’t match it.

let subArrayUntilFirstEvenIsReached = arr.drop { value in
  return value % 2 == 0
}
subArrayUntilFirstEvenIsReached // [9, 10, 29, 99, 3, 6]
Transforming an Array
Often we want to tranform our array into something else. Let’s start with this array and string:

var arr = [2, 6, 4, 9, 10, 29, 99, 3, 6]
var stringValue = "iwojfbaowinbvo"
The reduce method takes in a starting value and then adds all of the values in the array and returns a final sum.

let sum = arr.reduce(0) { sum, value in
  sum + value
}
sum // 168
This can also work with converting a string into a dictionary.

let stringDict = stringValue.reduce(into: [:]) { dict, letter in
  dict[letter, default: 0] += 1
}
// ["i": 2, "n": 1, "a": 1, "o": 2, "w": 2, "b": 1, "f": 1, "j": 1]
Need to create a new array that doesn’t have an nil values?

var partiallyNilArray = [3, nil, 1, 10, 8, nil]
let nonNilArray = partiallyNilArray.compactMap { value in
  value
}
nonNilArray
let cleanerNonNilArray = partiallyNilArray.compactMap { $0 }
cleanerNonNilArray
Reordering Elements
Reording elements in an array is quite common. Swift Arrays can sort, reverse, shuffle, and partition.

Need to sort in place?

var arr = [2, 6, 4, 9, 10, 29, 99, 3, 6]
arr.sort()
arr // [2, 3, 4, 6, 6, 9, 10, 29, 99]
We can also return a sorted array.

var arr = [2, 6, 4, 9, 10, 29, 99, 3, 6]
let sortedArray = arr.sorted()
sortedArray // [2, 3, 4, 6, 6, 9, 10, 29, 99]
What if we wanted sort custom data types? This method allows you to give it a predicate that allows for custom sorting.

var arr = [2, 6, 4, 9, 10, 29, 99, 3, 6]
let sortedArray = arr.sorted { value1, value2 in
  value1 > value2
}
sortedArray // [2, 3, 4, 6, 6, 9, 10, 29, 99]
Need to reverse the array?

var arr3 = [2, 6, 4, 9, 10, 29, 99, 3, 6]
arr3.reverse() // [6, 3, 99, 29, 10, 9, 4, 6, 2]
You can also partition your array. This is an interesting one. You can give it a predicate to partition with. Any element that matches the predicate will be “partitioned” and moved to the back of the array. The method returns the index of the start of the partition.

var arr6 = [22, 6, 31, 4, 9, 10, 29, 99, 3, 6]
let indexOfPartition = arr6.partition { value in
  value < 9
}
indexOfPartition // 6
arr6 // [22, 99, 31, 29, 9, 10, 4, 6, 3, 6]
Need to swap elements?

var arr7 = [22, 6, 31, 4, 9, 10, 29, 99, 3, 6]
arr7.swapAt(0, 3) // [4, 6, 31, 22, 9, 10, 29, 99, 3, 6]
Splitting and Joining Elements
Splitting up arrays is super easy in Swift. Let’s start with this array:

var arr = [22, 6, 31, 4, 9, 10, 29, 99, 4, 6]
Need to split an array at a given index?

arr.split(separator: 4) // [[22, 6, 31], [9, 10, 29, 99], [6]]
Need to split an array at a given character?

var mutltipleSentenceString = "This is a sentence. This is another sentence. This is also a sentence."
mutltipleSentenceString.split(separator: ".") // ["This is a sentence", " This is another sentence", " This is also a sentence"]
mutltipleSentenceString.split(separator: ". ", omittingEmptySubsequences: true) // ["This is a sentence", "This is another sentence", "This is also a sentence."]
What about converting the array into a single object?

var letterArray = ["a", "b", "c", "d", "e", "f", "g", "h"]
letterArray.joined() // "abcdefgh"
var names = ["Paul", "Chris", "Micheal", "Daniel", "Brian"]
names.joined(separator: ", ") // "Paul, Chris, Micheal, Daniel, Brian"
Creating and Applying Differences
Here is another interesting method that could really come in handy in some cases. The method “differences” takes another array and returns the differences between the two.

var numbers = [22, 6, 32]
var numbers1 = [1, 1, 1]
let differences = numbers.difference(from: numbers1)
Once you have the differences, you can actually apply the differences to the method that you wish to udpate by using the “apply” method.

numbers1 = numbers1.applying(differences) ?? numbers1
numbers1 // [22, 6, 32]
Comparing Arrays
There are two ways you can compare Arrays: using the “isEqual” operator or the “elementsEqual” method. Let’s start with two arrays:

var numbers = [22, 6, 31, 4, 9, 10, 29, 99, 4, 6]
var numbers1 = [22, 6, 31, 4, 9, 10]
You can compare the arrays with “==”:

numbers == numbers1 // false
Or you can compare with the “elementsEqual” method. Both ways do the same thing.

numbers.elementsEqual(numbers1) // false
The method “elementsEqual” also can be given a predicate that allows for complex data types to be equated.

struct Car {
  let numDoors: Int
}
var cars = Array(repeating: Car(numDoors: 4), count: 10)
var cars2 = Array(repeating: Car(numDoors: 4), count: 10)
cars.elementsEqual(cars2) { car, otherCar in
  car.numDoors == otherCar.numDoors
}
The nice thing about this method is that the Car Struct doesn’t need to conform to Equatable. For this example, I would recommend that you make Car conform to Equatable because that logic belongs inside that struct. But in the case where that’s not possible then this is a slick option!

Let’s say you want to know if one array’s prefix is equal to another array. You can use the “starts” method. If the elements are complex data types then you can give the method a predicate for more precise calculations:

numbers.starts(with: numbers1)
numbers.starts(with: numbers1) { element, otherElement in
  element == otherElement
}
Creating and Applying Differences
Here is another interesting method. The method “differences” takes another array and returns the differences between the two.

var numbers = [22, 6, 32]
var numbers1 = [1, 1, 1]
let differences = numbers.difference(from: numbers1)
Once you have the differences, you can actually apply the differences to the the original array that you wish to udpate by using the “apply” method.

numbers1 = numbers1.applying(differences) ?? numbers1
// [22, 6, 32]
Again, you can do this with complex data types as well.

Summary
There are so many methods already written for us in Swift Arrays. I didn’t event list all of the methods available. In the past, I have written extensions to get the funtionality that already exists. With our new found knowledge, we don’t have to anymore. Get to know these methods and use them in your code.
