//
//  PresentViewController.swift
//  Container
//
//  Created by Alexander Rozhdestvenskiy on 15.01.2022.
//

import UIKit

class PresentViewController: UIViewController {
    
    let stackView = UIStackView()
    let dissmissButton = UIButton(type: .system)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
    
    func style() {
        title = "Not shown"
        view.backgroundColor = .systemPink
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        dissmissButton.translatesAutoresizingMaskIntoConstraints = false
        dissmissButton.configuration = .filled()
        dissmissButton.setTitle("Dismiss", for: [])
        dissmissButton.addTarget(self, action: #selector(dissmissTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(dissmissButton)
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    @objc func dissmissTapped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
