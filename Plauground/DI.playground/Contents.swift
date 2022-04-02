import UIKit

// MARK: DI - внедрение зависимостей

// Constructor Injection - через конструктор класса

protocol EngineProtocol {
    func start()
    func stop()
}

protocol TransmissionProtocol {
    func change()
}

class Car {
    
    let engine: EngineProtocol
    let transmission: TransmissionProtocol
    
    init(engine: EngineProtocol, transmission: TransmissionProtocol) {
        self.engine = engine
        self.transmission = transmission
    }
}

// Method Injection

class SuperCar {
    
    var engine: EngineProtocol?
    var transmission: TransmissionProtocol?
    
    func setEngine(engine: EngineProtocol) {
        self.engine = engine
    }
    
    func setTransmission(transmission: TransmissionProtocol) {
        self.transmission = transmission
    }
}

// Interface Injection

protocol EngineMountable {
    func mountEngine(engine: EngineProtocol)
}

protocol TransmissionMountable {
    func mountTransmission(transmission: TransmissionProtocol)
}

class GiperCar: EngineMountable, TransmissionMountable {
    
    var engine: EngineProtocol?
    var transmission: TransmissionProtocol?
    
    func mountEngine(engine: EngineProtocol) {
        self.engine = engine
    }
    
    func mountTransmission(transmission: TransmissionProtocol) {
        self.transmission = transmission
    }
}
