import UIKit

// MARK: Method Dispatch - Диспечеризация

// 1. Direct dispatch

struct One {
    func go() {}
}

let one = One()
one.go()

// 2. Table dispatch

class Parent {
    func method1() {}
    func method2() {}
}

class Child: Parent {
    override func method2() {}
    func method3() {}
}

let child = Child()
child.method2()

// 3. Message dispatch

class ParentClass {
    dynamic func method1() {}
    dynamic func method2() {}
}

class ChildClass: ParentClass {
    override func method2() {}
    dynamic func method3() {}
}

let childMessage = ChildClass()
childMessage.method2()

// [weak self]

class Manager {
    
    func call1(comp: () -> Void) {
        
    }
    
    func call2(comp: @escaping () -> Void) {
        
    }
}

class Caller {
    
    let manager = Manager()
    
    private var result: String = ""
    
    func testA() {
        manager.call1 { [weak self] in
            self?.result = "Hello"
        }
        
    }
    
    func testB() {
        manager.call2 { [weak self] in
            self?.result = "Hello"
        }
        
    }
    
}

