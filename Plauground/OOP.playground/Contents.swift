import UIKit

// Наследование

class Piano: Instrument {
    let hasPedals: Bool
    
    static let whiteKeys = 52
    static let blackKeys = 36
    
    init(brand: String, hasPedals: Bool = false) {
        self.hasPedals = hasPedals
        super.init(brand: brand)
    }
    
    override func tune() -> String {
        return "Piano standart tuning for \(brand)"
    }
    
    override func play(music: Music) -> String {
        return play(music: music, usingPedals: hasPedals)
    }
    
    func play(music: Music, usingPedals: Bool) -> String {
        let preparedNotes = super.play(music: music)
        if hasPedals && usingPedals {
            return "Play piano notes \(preparedNotes) with pedals."
        } else {
            return "Play piano notes \(preparedNotes) without pedals."
        }
    }
}

let piano = Piano(brand: "Yamaha", hasPedals: true)
piano.tune()

let music = Music(notes: ["C", "D", "F"])
piano.play(music: music, usingPedals: false)

piano.play(music: music)

Piano.whiteKeys
Piano.blackKeys

class Guitar: Instrument {
    let stringGauge: String
    
    init(brand: String, stringGauge: String = "medium") {
        self.stringGauge = stringGauge
        super.init(brand: brand)
    }
}

class ClassicGuitar: Guitar {
    static let numberOfStrings = 6
    static let fretCount = 20
    
    override func tune() -> String {
        return "Tune \(brand) classic with E A D G B E"
    }
    
    override func play(music: Music) -> String {
        let preparedNotes = super.play(music: music)
        return "Play folk tune on frets \(preparedNotes)."
    }
}

let classicGuitar = ClassicGuitar(brand: "Roland", stringGauge: "Ligth")
classicGuitar.tune()
classicGuitar.play(music: music)

class Amplifier {
    private var volume: Int
    private(set) var isOn: Bool
    
    init() {
        isOn = false
        volume = 0
    }
    
    func plugIn() {
        isOn = true
    }
    
    func unplug() {
        isOn = false
    }
    
    var volumeApm: Int {
        get {
            return isOn ? volume : 0
        }
        
        set {
            volume = min(max(newValue, 0), 10)
        }
    }
}

class ElectricGuitar: Guitar {
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "Ligth", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        amplifier.volumeApm = 5
        return "Tune \(brand) electric with E A D G B E"
    }
    
    override func play(music: Music) -> String {
        let preparedNotes = super.play(music: music)
        return "Play solo \(preparedNotes) at volume \(amplifier.volumeApm)"
    }
}

class BassGuitar: Guitar {
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "Heavy", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        return "Tune \(brand) bass with E A D G"
    }
    
    override func play(music: Music) -> String {
        let preparedNotes = super.play(music: music)
        return "Play bass line \(preparedNotes) at volume \(amplifier.volumeApm)"
    }
}

let amplifier = Amplifier()

let electricGuitar = ElectricGuitar(brand: "Gibson", stringGauge: "medium", amplifier: amplifier)
electricGuitar.tune()

let bassGuitar = BassGuitar(brand: "Fender", stringGauge: "heavy", amplifier: amplifier)
bassGuitar.tune()

bassGuitar.amplifier.volumeApm = 3

// Полиморфизм

class Band {
    let instruments: [Instrument]
    
    init(instrument: [Instrument]) {
        self.instruments = instrument
    }
    
    func perfom(music: Music) {
        for instrument in instruments {
            instrument.perform(music: music)
        }
    }
}

let instruments = [piano, classicGuitar, bassGuitar, electricGuitar]

let band = Band(instrument: instruments)
band.perfom(music: music)
