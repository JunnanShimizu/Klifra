//
//  AppDelegate.swift
//  TabsSwift
//
//  Created by Matthew Quinn on 11/9/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Customize tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // Set background color for the entire tab bar
        appearance.backgroundColor = UIColor(red: 44 / 255, green: 138 / 255, blue: 111 / 255, alpha: 1)
        
        // Customize unselected item appearance (new green color)
        let unselectedGreen = UIColor(red: 14 / 255, green: 61 / 255, blue: 16 / 255, alpha: 1)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedGreen]
        appearance.stackedLayoutAppearance.normal.iconColor = unselectedGreen

        // Customize selected item appearance (white color)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white

        // Apply the appearance to all tab bars globally
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        // Set the tint color for the selected state
        UITabBar.appearance().tintColor = UIColor.white

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
