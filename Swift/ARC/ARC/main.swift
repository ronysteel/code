import Foundation

class Person {
    let name: String // stored constant property
    
    init(name: String) {
        self.name = name
        print("\(#file): \(name) is being initialized")
    }
    
    deinit {
        print("\(#file): \(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

// Strong references
reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil // ARC will deallocate the Person instance now

// MARK: - Strong Reference Cycle

print("===== strong reference cycle test =====")

var john: PersonWithApartment?
var unit4A: Apartment?

john = PersonWithApartment(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

// Create strong reference cycle
john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

// MARK: - Weak Reference

print("===== weak reference test =====")

var mark: PersonWithWeakApartment?
var unit10A: ApartmentWithWeakPerson?

mark = PersonWithWeakApartment(name: "Mark Appleseed")
unit10A = ApartmentWithWeakPerson(unit: "10A")

mark!.apartmentWeak = unit10A
unit10A!.tenant = mark

mark = nil
unit10A = nil

// MARK: - Safe Unowned Reference

print("===== safe unowned reference test =====")

var andy: Customer?

andy = Customer(name: "Andy Appleseed")
andy!.card = CreditCard(number: 1234_5678_8888_8888, customer: andy!)

andy = nil

// MARK: - Unowned Reference with Implicit Unwrapped Optional

print("===== unowned reference with implicitly unwrapped optional test =====")

var country = Country(name: "Canada", capitalName: "Ottawa")

// MARK: - Strong Reference Cycle for Closures

print("===== strong reference cycle for closures test =====")

let heading = HTMLElement(name: "h1")
let defaultText = "hello html"

print(heading.asHTML())

heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

paragraph = nil // not able to deallocate due to strong reference cycle

// using capture list to break strong reference cycle
var paragraph2: UnownedHTMLElement? = UnownedHTMLElement(name: "p", text: "hello, world")
print(paragraph2!.asHTML())
paragraph2 = nil

/*
 
 /Users/choonsiong/Code/Swift/ARC/ARC/main.swift: John Appleseed is being initialized
 /Users/choonsiong/Code/Swift/ARC/ARC/main.swift: John Appleseed is being deinitialized
 ===== strong reference cycle test =====
 /Users/choonsiong/Code/Swift/ARC/ARC/main.swift: John Appleseed is being initialized
 /Users/choonsiong/Code/Swift/ARC/ARC/StrongReferenceCycle.swift: 4A is being initialized
 ===== weak reference test =====
 /Users/choonsiong/Code/Swift/ARC/ARC/main.swift: Mark Appleseed is being initialized
 /Users/choonsiong/Code/Swift/ARC/ARC/WeakReference.swift: 10A is being initialized
 /Users/choonsiong/Code/Swift/ARC/ARC/WeakReference.swift: Mark Appleseed is being deinitialized
 /Users/choonsiong/Code/Swift/ARC/ARC/main.swift: Mark Appleseed is being deinitialized
 /Users/choonsiong/Code/Swift/ARC/ARC/WeakReference.swift: Apartment 10A is being deinitialized
 ===== safe unowned reference test =====
 /Users/choonsiong/Code/Swift/ARC/ARC/UnownedReference.swift: Andy Appleseed is being initialized
 /Users/choonsiong/Code/Swift/ARC/ARC/UnownedReference.swift: card 1234567888888888 is being initialized for customer Andy Appleseed
 /Users/choonsiong/Code/Swift/ARC/ARC/UnownedReference.swift: Andy Appleseed is being deinitialized
 /Users/choonsiong/Code/Swift/ARC/ARC/UnownedReference.swift: card 1234567888888888 is being deinitialized
 ===== unowned reference with implicitly unwrapped optional test =====
 /Users/choonsiong/Code/Swift/ARC/ARC/UnownedAndImplicit.swift: city Ottawa is being initialized for Canada
 /Users/choonsiong/Code/Swift/ARC/ARC/UnownedAndImplicit.swift: country Canada is being initialized with capital city Ottawa
 ===== strong reference cycle for closures test =====
 /Users/choonsiong/Code/Swift/ARC/ARC/StrongReferenceCycleClosure.swift: h1 is being initialized
 <h1 />
 <h1>hello html</h1>
 /Users/choonsiong/Code/Swift/ARC/ARC/StrongReferenceCycleClosure.swift: p is being initialized
 <p>hello, world</p>
 /Users/choonsiong/Code/Swift/ARC/ARC/CaptureListClosure.swift: p is being initialized
 <p>hello, world</p>
 /Users/choonsiong/Code/Swift/ARC/ARC/CaptureListClosure.swift: p is being deinitialized
 Program ended with exit code: 0
 
 */
