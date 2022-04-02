import UIKit

// Базовые конструкции языка

print("Hello World")
print("Hello"); print("World")

let a = 2
-3
let b = 2 -
3

if a == 10 {
    print(a)
} else if a == 20 {
    print(b)
} else {
    print("3")
}

for i in 0..<10 { i }
for i in 0...10 { i }

var iw = 0
while iw < 10 {
    iw += 1
}

var ir = 0
repeat {
    ir += 1
} while ir < 10

var array1 = [1, 2, 3]
for element in array1 {
    print(element)
}

// Функции

func foo() {
    
}

func foo2() -> Int {
    2
}

func foo3(p: String) {
    print(p)
}

func foo4(phrase p: String) {
    print(p)
}

func foo5(_ p: String) {
    print(p)
}

foo3(p: "Go")
foo4(phrase: "Go")
foo5("Go")

func sub(lhs: Int = 0, rhs: Int = 0) -> Int {
    return lhs + rhs
}

sub()
sub(lhs: 1)
sub(rhs: 1)
sub(lhs: 1, rhs: 1)

func guardExample(a: Int) -> String? {
    guard a == 2 else { return nil }
    
    return "Guard"
}

struct Door {
    func openDoor() {}
    func closeDoor() {}
    func handleDoor() {}
    
    func check1() -> Bool {
        return true
    }
    
    func check2() -> Bool {
        return false
    }
}


enum DoorErrors: Error {
    case somethingBad
}

func handleTheDoor() throws {
    let door = Door()
    door.openDoor()
    defer { door.closeDoor() } // при выходе из любого блока вызывается функция closeDoor
    
    if !door.check1() {
        throw DoorErrors.somethingBad
    }
    
    if !door.check2() {
        // door.closeDoor()
        return
    }
    
    door.handleDoor()
    door.closeDoor()
}

// Классы

class Car {
    let mark: String = "Mark"
    let model: String = "Model"
    var mileage: Int = 4
    let steelType: Int = 5
    
    var computedPropertie: Int {
        // вычисление значения
        get {
            mileage + steelType
        }
        // установка значения
        set {
            self.mileage = newValue - steelType
        }
    }
}

    // Get, получаем значение переменной computedPropertie
var myCar = Car()
myCar.mileage = 6
myCar.computedPropertie

    // Set, устанавливаем значение переменной mileage
myCar.computedPropertie = 12
myCar.mileage

// Структуры

struct Auto {
    let mark: String
    var model: String
} // автоматический инициализатор

/*
 Структуры - тип значения, хранится на стеке
 Классы - ссылочный тип, хранится в куче
 
 отличия структур:
    - нет наследования
    - отсутствуют деинициализаторы
    - нет механизма подсчета ссылок
 
 Copy-on-Write
    копируется только когда изменяется
 */

// Управление памятью

    // MRC - ручное управление памятью

    // ARC - автоматический подсчет ссылок

// Перечисления

enum Planets: Int {
    case mercury = 1
    case venus = 2
    case mars
    case earth
    case jupiter
    case saturn
    case neptune
    case uranus
    
    var isInnerPlanet: Bool {
        switch self {
        case .mercury, .venus, .earth, .mars:
            return true
        default:
            return false
        }
    }
}

let earth = Planets.earth
let jupiter: Planets = .jupiter
print(jupiter.rawValue)

// Optional

var optional: String? = nil

var view1: UIView? = nil
var view2: UIView? = UIView()

    // способы обработки опциональных типов:
    // if let
    // guard let
    // force unwrapped - осторожно
    // ?? значение по умолчанию

// Замыкания

let sayHello = {
    print("Hi")
}

sayHello()

let greetings: (String) -> Void = { name in
    print("Hi \(name)")
}

greetings("Alex")

// Полезные функции стандартной библиотеки

let res = array1.map { $0 + 1 }
print(res)

let array2 = [[1, 2], [3, 4]]
let flat = array2.flatMap { $0 }
print(flat)

let array3 = [1, nil, 3, nil, 6]
let compact = array3.compactMap { $0 }
print(compact)

// Полезные классы стандартной библиотеки

let now = Date()
let ts = now.timeIntervalSince1970


