//
//  AppDelegate.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 24.05.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //ModulBuilder.shared.tabbarController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
      
        window?.rootViewController = ModulBuilder.shared.tabbarController()

        return true
    }

}

