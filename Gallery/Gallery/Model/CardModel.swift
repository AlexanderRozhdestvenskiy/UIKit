//
//  CardModel.swift
//  Gallery
//
//  Created by Alexander Rozhdestvenskiy on 09.12.2021.
//

import UIKit

enum CardType: String {
    case skeleton = "skeleton"
    case monkey = "monkey"
    case owl = "owl"
    case panda = "panda"
    
    func getColor() -> UIColor {
        switch self {
        case .skeleton:
            return .green
            
        case .monkey:
            return .orange
            
        case .owl:
            return .red
            
        case .panda:
            return .purple
        }
    }
}

class CardModel {
    var imageName: String
    var characterName: String
    var backgroundColor: UIColor
    
    init(imageName: String, characterName: String, backgroundColor: UIColor) {
        self.imageName = imageName
        self.characterName = characterName
        self.backgroundColor = backgroundColor
    }
    
    public static func getCardDetails(for type: CardType) -> CardModel {
        return CardModel(
            imageName: type.rawValue,
            characterName: type.rawValue.capitalized,
            backgroundColor: type.getColor())
    }
}
