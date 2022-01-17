//
//  AppDelegate.swift
//  Page
//
//  Created by Alexander Rozhdestvenskiy on 16.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = DemoViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        return true
    }
}
