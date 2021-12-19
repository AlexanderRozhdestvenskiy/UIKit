//
//  SceneDelegate.swift
//  TableSeanAllen
//
//  Created by Alexander Rozhdestvenskiy on 19.12.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let vc = UINavigationController(rootViewController: ViewController())
        vc.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
    }
}

