import UIKit

// ARC - автоматический подсчет ссылок

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
        print("\(name) проинициализирован")
    }
    
    deinit {
        print("\(name) удален из памяти")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "Иван")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil

// Цикл сильных ссылок или перекрестные ссылки

class Hotel {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var apartament: Apartament?
    
    deinit {
        print("\(name) выезжает")
    }
}

class Apartament {
    var room: String
    
    init(room: String) {
        self.room = room
    }
    
    weak var hotel: Hotel?
    
    deinit {
        print("Апартаменты \(room) освобождаются")
    }
}

var objHotel: Hotel?
var objAp: Apartament?

objHotel = Hotel(name: "Григорий")
objAp = Apartament(room: "112")

objHotel!.apartament = objAp
objAp!.hotel = objHotel

objAp = nil
objHotel = nil

// бесхозная ссылка

class Country {
    let name: String
    var capitalName: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalName = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Россия", capitalName: "Москва")
print("Страна - \(country.name), а столица - \(country.capitalName.name)")

// MARK: Stack vs Heap

/*
 Области оперативной памяти, память в Стеке выделяется при компиляции, а в Куче во время рантайма
 
 Стек быстрее, проще информация
 Куча медленне, но информация сложнее
 
 Стек - тип значения
 Куча - ссылочный тип
 */

var myNum = 10

func inPlace(number: inout Int) {
    number *= 2
}

inPlace(number: &myNum)

// все параметры функции является константами
