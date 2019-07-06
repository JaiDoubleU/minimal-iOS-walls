//
//  AppDelegate.swift
//  MySampleApp
//
//  Created by Alex Núñez on 07/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	static var shared = AppDelegate() // Declare a static variable as an instance of AppDelegate
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		// App theme
		ThemeManager.applyTheme()
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.backgroundColor = UIColor.white
		window?.rootViewController = AppCoordinator.presentHits()
		window?.makeKeyAndVisible()
		
		return true
	}
	

}

