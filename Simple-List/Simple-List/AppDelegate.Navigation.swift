//
//  AppDelegate.Navigation.swift
//  Simple-List
//
//  Created by Corey Duncan on 21/6/23.
//

import UIKit

extension AppDelegate {
    func configureNavigationBarAppearance() {
        UINavigationBar.appearance().tintColor = UIColor(named: "dark.text")
        UINavigationBar.appearance().barTintColor = UIColor(named: "background")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "background")
        UINavigationBar.appearance().shadowImage = nil
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
}

