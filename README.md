# Structs

![VeronicaRoth](http://i.imgur.com/pndJPoU.jpg)  

> Becoming fearless isn't the point. That's impossible. It's learning how to control your fear, and how to be free from it. -[Veronica Roth](https://en.wikipedia.org/wiki/Veronica_Roth)
 

## Learning Objectives

* 


## Outline / Notes

*  What can do with with a class?

```swift
class Person {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func goForARun() {
        // begin running!
    }
}
```

```swift
let jim = Person(firstName: "Jimbo", lastName: "Giuseppe")

print(jim.fullName)
// Jimbo Giuseppe

jim.goForARun()
```


We can,
* Define properties to store values
* Define methods to provide functionality
* Define initializers to set up their initial state

We can do this exact same thing with Structures. They both have many things in common, some of those things are listed above.

Here's how you create a `struct`

```swift
struct Person {
    // TODO: Define a person
}
```

That's it. Instead of using the keyword `class` when creating your new type, you use the keyword `struct`. So lets complete the implementation of a `Person` as a `struct`.

```swift
struct Person {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func goForARun() {
        // begin running!
    }
}
```

```swift

let jim = Person(firstName: "Jimbo", lastName: "Giuseppe")

print(jim.fullName)
// Jimbo Giuseppe

jim.goForARun()
```

So then what's the difference?

Structures are _value types_. A _value type_ is a type whose value is _copied_ when it is assigned to a variable or constant, or when it is passed to a function.

What does that mean? Lets see.

```swift
class Dog {
    var name: String
    
    init(name: String) { self.name = name }
}

struct Cat {
    var name: String
    
    init(name: String) { self.name = name }
}
```

Here we have a `Dog` type which is a class and a `Cat` type which is a struct. Lets see how they both behave.

```swift
let ralph = Dog(name: "Ralph")
let hanna = Cat(name: "Hanna")
```

```swift
var sameDog = ralph

sameDog.name = "Biscuit"

print(sameDog.name)
// prints "Biscuit"

print(ralph.name)
// prints "Biscuit"
```

Here we created a new variable called `sameDog` and assigned it a value (using the assignment operator, `=`). What value did we assign to this variable? Well, we assigned it the value which was assigned to `ralph` which was an instance of a `Dog` which had its name set to "Ralph".


When assigning a value to a variable or constant like this, if what's on the right side of the assignment operator is a class (like this example), we are making reference to that one instance of `Dog`. 


Both variables make reference to the one instance of `Dog`. That is reference semantics. Whatever we change with a variable `ralph` will also change the variable `sameDog` and vice-versa. That is because they each don't get their own unique copy, the variable is referring to the same instance.

Lets try that with a struct.

```swift
var diffCat = hanna

diffCat.name = "Garfield"

print(diffCat.name)
// prints "Garfield

print(hanna.name)
// prints "Hanna"
```

Here we created a new variable called `diffCat` and assigned it a value. We assigned it the value which was originally assigned to the `hanna` variable. But unlike classes, we aren't making reference to this one single instance of `Dog`, here we are making a copy of the `Cat` instance. We have our own unique copy stored within the `diffCat` variable. So, if we were to change `diffCat`'s name (like we did), it's changing its own copy thus unaffecting `hanna`'s name property.

That is what is known as value semanatics. Structs are _value types_. 

I like the idea of showing them another example of Class vs Struct by using the cup of coffee as an example.

```swift
class Cup {
    var amountOfCoffee: Double = 0.0
}

func fillCup(cup: Cup) {
    cup.amountOfCoffee = 10
}

let mikesCup = Cup()

fillCup(mikesCup)

mikesCup.amountOfCoffee // 10
```

If we were to change the `Cup` to be a struct instead of a class, we would be met with the following error:

![](http://i.imgur.com/NG5U7ZK.png)

I think at this point, we need to discuss how even though an instance of a class is created with the `let` keyword, we can still change its properties (if those properties are declared with `var`). But if we were to declare an instance of a struct with the `let` keyword, we would be unable to change **any** of its properties, even if those properties were declared with the `var` keyword.

So how do we fix that?

```swift
struct Cup {
    var amountOfCoffee: Double = 0.0
}

func fillCup(cup: Cup) {
    var newCup = cup
    newCup.amountOfCoffee = 10
}

let mikesCup = Cup()

fillCup(mikesCup)

mikesCup.amountOfCoffee // 0
```

![](http://i.imgur.com/0aQBsZW.gif)

We should instead make this an instance method on the struct and not a global function. Because we really want to be able to fill our own cup.

```swift
struct Cup {
    var amountOfCoffee: Double = 0.0
    
    mutating func fillCup() {
        amountOfCoffee = 10
    }
}

var mikesCup = Cup()

print(mikesCup.amountOfCoffee)
// prints "0.0"

mikesCup.fillCup()

print(mikesCup.amountOfCoffee)
// prints "10.0"
```

I think we then need to talk about the `mutating` keyword at this point and how it pertains to functions on structs that within their implementation mutate or change any of its own instance properties (like our example here). Classes aren't required to use the `mutating` keyword.

If we were to change `mikesCup` to be a constant (declaring it with the `let` keyword), would this code run?

The answer is no.

![](http://i.imgur.com/25YnpDr.png)

Do we talk about further differences between classes and structs here? Meh, I'm not really sure.

```
* Inheritance enables one class to inherit the characteristics of another.
* Type casting enables you to check and interpret the type of a class instance at runtime.
* Deinitializers enable an instance of a class to free up any resources it has assigned.
* Reference counting allows more than one reference to a class instance.”

Excerpt From: Apple Inc. The Swift Programming Language (Swift 2.2) iBooks. 
```

I think we should mention that `Enum`'s are also value types (like Structs). 

 

<a href='https://learn.co/lessons/StructR' data-visibility='hidden'>View this lesson on Learn.co</a>
