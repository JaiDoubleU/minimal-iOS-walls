//
//  AppStoryboard.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

/// Enum with all the storyboards of the app
enum AppStoryboard: String {
	
	case main = "Main"
	case launchScreen = "LaunchScreen"
	
	/// returns an instance of the storyboard based on the enum raw value
	var instance: UIStoryboard {
		return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
	}
	
	/// Instanciate a view controller from teh storyboard
	///
	/// - Parameter viewControllerClass: viewController type
	/// - Returns: instance
	func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T? {
		let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
		return instance.instantiateViewController(withIdentifier: storyboardID) as? T
	}
	
	/// returns the initial viewController of a storyboard
	func initialViewController() -> UIViewController? {
		return instance.instantiateInitialViewController()
	}
	
}
