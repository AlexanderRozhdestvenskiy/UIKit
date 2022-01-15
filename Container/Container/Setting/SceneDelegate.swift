//
//  SceneDelegate.swift
//  Container
//
//  Created by Alexander Rozhdestvenskiy on 15.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let vc1 = PageViewController()
        let vc2 = NavigationViewController()
        
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        
        let nc1 = UINavigationController(rootViewController: vc1)
        let nc2 = UINavigationController(rootViewController: vc2)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [nc1, nc2]
        
        tabBarController.tabBar.tintColor = .systemOrange
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .systemGray6
        
        window?.rootViewController = tabBarController
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
}
