//
//  AppDelegate.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import UIKit
import Events_List

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureNavigationBarAppearance()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
                
        let initialViewController = Events_List().loadController()
        initialViewController.title = "Upcoming events"

        self.window?.rootViewController = UINavigationController(rootViewController: initialViewController)
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

