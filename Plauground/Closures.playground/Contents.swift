import UIKit

// MARK: Closures / Замыкания

/*
 Замыкания принимают одну из трех форм:

 1) Глобальные функции - это замыкания, которые имеют имя и не принимают никаких значений.
 2) Вложенные функции - это замыкания, которые имеют имя и могут принимать значения от своей вложенной функции.
 3) Выражения закрытия - это безымянные закрытия, написанные на облегченном синтаксисе, которые могут захватывать значения из окружающего контекста.
 */

var closure1: () -> () = {
    print("Hello from Closure 1")
}
closure1()

var closure2: (String) -> Void = { name in
    print(name)
}
closure2("Go")

var closure3 = { (name: String) -> Void in
    print(name)
}
closure3("Yes")

// MARK: @escaping - убегающая функция

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// MARK: Типы функций

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// (Int, Int) -> Int

func printHelloWorld() {
    print("hello, world")
}

// () -> Void

var mathFunction: (Int, Int) -> Int = addTwoInts // использование типов функции

// MARK: Захват значений

var a = 2
var b = 3

let mySuper = {
    return a + b
}

mySuper()

let gameCl = {
    a = 5
}

gameCl()

print(a)
