import Foundation

// Инкапсуляция

final public class Music {
    public let notes: [String]
    
    public init(notes: [String]) {
        self.notes = notes
    }
    
    public func prepared() -> String {
        return notes.joined(separator: " ")
    }
}

open class Instrument {
    public let brand: String
    
    public init(brand: String) {
        self.brand = brand
    }
    
    open func tune() -> String {
        fatalError("\(brand)")
    }
    
    open func play(music: Music) -> String {
        return music.prepared()
    }
    
    final public func perform(music: Music) {
        print(tune())
        print(play(music: music))
    }
}
