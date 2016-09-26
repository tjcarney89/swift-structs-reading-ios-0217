# Structs

![VeronicaRoth](http://i.imgur.com/pndJPoU.jpg)  

> Becoming fearless isn't the point. That's impossible. It's learning how to control your fear, and how to be free from it. -[Veronica Roth](https://en.wikipedia.org/wiki/Veronica_Roth)

## Overview

In this lesson. we'll cover the basics about Swift's structs. 

## Learning Objectives

* Create and describe the syntax of structs
* Distinguish structs from classes
* Explain the difference between reference and value types when assigning each to variables and constants
* Change a struct's properties

## Structs

In the last few lessons, you've learned how you can use classes to make your own data types in Swift, complete with their own properties and behaviors (known formally as _methods_). As a reminder, take a look at how you might create a class to represent a `Person`. It would probably look something like this:

```swift
class Person {
    let firstName: String
    let lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func goForARun() {
        print("I love running!")
    }
}
```

You can create instances of that class pretty easily:

```swift
let jim = Person(firstName: "Jimbo", lastName: "Guiseppe")
print(jim.fullName)
// prints "Jimbo Guiseppe"
jim.goForARun()
// prints "I love running!"
```

In Swift, structs are very similar. They are data types that have properties, methods, and initializers. In fact, you declare them almost the same as you do a class, except you use the `struct` keyword instead of `class`. Here's how you could define a `Person` struct:

```swift
struct Person {
    let firstName: String
    let lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    func goForARun() {
        print("I love running!")
    }
}
```

And here's how you could create an instance of your `Person` struct:

```swift
let jim2 = Person(firstName: "Jimbo", lastName: "Guiseppe")
print(jim.fullName)
// prints "Jimbo Guiseppe"
jim.goForARun()
// prints "I love running!"
```

Not much different from a class, huh? The biggest difference you may have noticed is that the `Person` struct does not have an initializer. Unlike classes, you don't _have_ to define an initializer for a struct. If you don't define one, a default one will be created that simply takes all stored (not computed) properties as parameters, and assigns those parameters to the appropriate property. You _can_ define your own initializer, though, if you want it to do more than that—just like a class.

So why use a struct instead of a class? Are default initializers the only benefit structs have?

Nope! Structs behave a bit differently than classes. Classes are _reference_ types, whereas structs are _value_ types.

Wait, reference types? Value types? What does that gobbledygook mean? Well, it's probably best to illustrate with an example.

First, let's go back to our example of a `Person` _class_. This time, though, make the properties variables, so that you can change them after you have initialized the class:

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
}
```

Now, create an instance of this `Person` called `person1`, then create a variable called `person2` and assign `person1` to it, like this:

```swift
var person1 = Person(firstName: "Luke", lastName: "Skywalker")
var person2 = person1
```

Now try printing out their full names:

```swift
print(person1.fullName)
// prints "Luke Skywalker"
print(person2.fullName)
// prints "Luke Skywalker"
```

"Luke Skywalker" is printed twice. Pretty much what you expected, right? Now, try changing `person1`'s `firstName` and `lastName`, and then printing the `fullName`s of both `person1` and `person2` again:

```swift
person1.firstName = "Han"
person1.lastName = "Solo"
print(person1.fullName)
// prints "Han Solo"
print(person2.fullName)
// prints "Han Solo"
```

"Han Solo" is printed twice! Is this what you expected?

When you instantiate an object, that instance is stored _once_ in memory. `person1` _points_ to that instance in memory. When you assign `person1` to `person2`, `person2` points to that same instance! Which means that if you change a property in `person1`, that change will be reflected in `person2`—because they are pointing to the same object!

Think of it like a house. If I tell you where I live, I can say, "I live at 292 West 10th Street." I can also tell you, "I live in the blue house on the corner of West 10th Street and 13th Avenue." It's the same house! I'm just describing the location in two ways. If I paint my house red, then both places will be a red house.

Structs are a bit different. Structs are value types, so when you assign the value of one struct to another variable (or constant), it gets _copied_ in memory, and each variable (or constant) point to _different_ instances of that struct. Let's see this in action by first creating a `Person` struct again. This one will also have variable properties.

```swift
struct Person {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
```

Now, repeat the previous exercise by creating a new instance of this `Person` struct, then assign it to another variable, then print out the full names of each variable:

```swift
var hero1 = Person(firstName: "Luke", lastName: "Skywalker")
var hero2 = hero1
print(hero1.fullName)
// prints "Luke Skywalker"
print(hero2.fullName)
// prints "Luke Skywalker"
```

Once again, you'll see "Luke Skywalker" printed to the console twice.

Now, change the first name of `hero1` to "Han" and the last name of `hero1` to "Solo", and print each variable's full name again. What do you expect to see in the console this time?

```swift
hero1.firstName = "Han"
hero1.lastName = "Solo"
print(hero1.fullName)
// prints "Han Solo"
print(hero2.fullName)
// prints "Luke Skywalker"
```

This time, you see both "Han Solo" and "Luke Skywalker" printed to the console. Why? Well, `hero1` and `hero2` both point to different copies of the `Person` struct. Changing `hero1`'s properties does not affect the properties of `hero2`, because they are different instances!

## Coffee Talk

Let's talk about coffee for a second. Here's a pretty simple class for representing a mug of coffee:

```swift
class Mug {
    var amountOfCoffee: Double = 0.0
}
```

An empty mug of coffee is pretty useless, so here's a function to fill it up:

```swift
func fillMug(mug: Mug) {
    mug.amountOfCoffee = 10.0
}
```

And now some code to fill 'er up:

```swift
let myMug = Mug()
print(myMug.amountOfCoffee)
// prints "0.0"
fillMug(myMug)
print(myMug.amountOfCoffee)
// prints "10.0"
```

As you probably expected, the code above first prints "0.0" to the console, then "10.0".

But wait... `myMug` is a constant, so how can you change the property? When it comes to classes, `myMug` being constant simply means you can't assign `myMug` to another instance—but you can still change its properties, because the `Mug` class is a _reference_ type. In other words, you can't change what `myMug` _points_ to, but you can change its _contents_.

Let's try to do the same thing with a struct. First, a simple `Mug` struct, and its accompanying `fillMug()` function:

```swift
struct Mug {
    var amountOfCoffee: Double = 0.0
}

func fillMug(mug: Mug) {
    mug.amountOfCoffee = 10.0
}
```

Wait...that doesn't even compile! If you try to write that code, you'll get an error stating that "'mug' is a 'let' constant."

![Mug is a let constant](https://s3.amazonaws.com/learn-verified/mug-let-constant.png)

What's going on? Remember how structs are _value_ types, so changing the value of a property doesn't affect other copies of that struct? When you pass a struct into a function, that function receives a _copy_ of the struct. Changing that copy's properties won't affect anything outside of that function (it's a copy, after all), so Swift won't even bother to let you do that.

In order to change the properties of a struct, you need to make `fillCup()` a method. You could modify the `Mug` struct to look like this:

```swift
struct Mug {
    var amountOfCoffee: Double = 0.0

    func fillMug() {
        amountOfCoffee = 10.0
    }
}
```

Oy...we're still getting an error here, though.

![self is immutable](https://s3.amazonaws.com/learn-verified/mug-property-constant.png)

"Self is immutable"? What does _that_ mean?

In case you missed it before, structs are _value_ types. Changes in properties are not reflected on _copies_ of that struct, so by default Swift doesn't even allow instances of a struct to modify its own properties.

So what, you're just hosed? Doomed to live a caffeine-free life?

Not exactly. You _can_ change properties within a struct's methods if you mark them with the `mutating` keyword:

```swift
struct Mug {
    var amountOfCoffee: Double = 0.0

    mutating func fillMug() {
        amountOfCoffee = 10.0
    }
}
```

Now you're free to fill up your mug:

```swift
var myMug1 = Mug()
print(myMug1.amountOfCoffee)
// prints "0.0"
myMug1.fillMug()
print(myMug1.amountOfCoffee)
// prints "10.0"
```

What if you create a `Mug` constant?

```swift

let myMug2 = Mug()
myMug2.fillMug()
```

Nope! You can't do that.

![Constant Mug](https://s3.amazonaws.com/learn-verified/mug-constant.png)

Unlike classes, a _constant_ struct's properties cannot be changed—not from outside the struct, not even from within the struct's own methods, even if they're marked as `mutating`. Once a struct is constant, it is _constant_. It can't change.

Structs aren't the only value types in Swift: Enums are value types, too. You'll actually encounter value types quite a bit. Many of Swift's core data structures, including strings, arrays, and dictionaries, are structs, too.

As you become more accustomed to Swift, you'll start to figure out when you should use classes and when you should use structs. For right now, it's generally easier to favor structs over classes. As you grow as a Swift programmer, though, you'll find many uses for both.

<a href='https://learn.co/lessons/StructR' data-visibility='hidden'>View this lesson on Learn.co</a>
