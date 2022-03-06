//
//  BackgroundView.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 03.03.2022.
//

import UIKit

class BackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let gradient = CAGradientLayer()
        
        gradient.frame = bounds
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
