//
//  AppDelegate.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let testSports = [Feature.Domain.Sport.tennisFixture,
                          Feature.Domain.Sport.f1Fixture]

        let viewmodel = SportsViewModel(sports: testSports)
        let initialViewController = SportsViewController(with: viewmodel)

        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

