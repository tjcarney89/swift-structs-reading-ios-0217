class Person_ {
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

let jim = Person_(firstName: "Jimbo", lastName: "Guiseppe")
print(jim.fullName)
jim.goForARun()


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

let jim2 = Person(firstName: "Jimbo", lastName: "Guiseppe")
print(jim.fullName)
jim.goForARun()



class PersonReference {
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

var person1 = PersonReference(firstName: "Luke", lastName: "Skywalker")
var person2 = person1
print(person1.fullName)
print(person2.fullName)
person1.firstName = "Han"
person1.lastName = "Solo"
print(person1.fullName)
print(person2.fullName)



struct PersonValue {
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

var hero1 = PersonValue(firstName: "Luke", lastName: "Skywalker")
var hero2 = hero1
print(hero1.fullName)
print(hero2.fullName)
hero1.firstName = "Han"
hero1.lastName = "Solo"
print(hero1.fullName)
print(hero2.fullName)



class Mug_ {
    var amountOfCoffee: Double = 0.0
}

func fillMug_(mug: Mug_) {
    mug.amountOfCoffee = 10.0
}

let myMug_ = Mug_()
print(myMug_.amountOfCoffee)
fillMug_(myMug_)
print(myMug_.amountOfCoffee)



struct Mug {
    var amountOfCoffee: Double = 0.0

    mutating func fillMug() {
        amountOfCoffee = 10.0
    }
}

var myMug1 = Mug()
print(myMug1.amountOfCoffee)
myMug1.fillMug()
print(myMug1.amountOfCoffee)
