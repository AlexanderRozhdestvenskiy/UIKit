//
//  AnchorViewController.swift
//  TableSeanAllen
//
//  Created by Alexander Rozhdestvenskiy on 20.12.2021.
//

import UIKit

class AnchorViewController: UIViewController {
    
    private lazy var myButton1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var myButton2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var myButton3: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setButton()
    }
    
    func setButton() {
        myButton1.setTitle("Button", for: .normal)
        myButton1.backgroundColor = .systemBlue
        myButton1.setTitleColor(.white, for: .normal)
        myButton1.layer.cornerRadius = 15
        
        myButton2.setTitle("Button", for: .normal)
        myButton2.backgroundColor = .systemPink
        myButton2.setTitleColor(.white, for: .normal)
        myButton2.layer.cornerRadius = 15
        
        myButton3.setTitle("Button", for: .normal)
        myButton3.backgroundColor = .systemGreen
        myButton3.setTitleColor(.white, for: .normal)
        myButton3.layer.cornerRadius = 15
        myButton3.addTarget(self, action: #selector(printButton), for: .touchUpInside)
        
        setConstraint()
        
    }
    
    func setConstraint() {
        view.addSubview(myButton1)
        view.addSubview(myButton2)
        view.addSubview(myButton3)
        
        myButton1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myButton1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        myButton1.trailingAnchor.constraint(equalTo: myButton2.leadingAnchor, constant: -16).isActive = true
        myButton1.widthAnchor.constraint(equalTo: myButton2.widthAnchor).isActive = true
        myButton1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        myButton2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myButton2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        myButton2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        myButton3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        myButton3.widthAnchor.constraint(equalTo: myButton2.widthAnchor).isActive = true
        myButton3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton3.bottomAnchor.constraint(equalTo: myButton2.topAnchor, constant: -16).isActive = true
    }
    
    @objc private func printButton() {
        print("Click")
    }
}
