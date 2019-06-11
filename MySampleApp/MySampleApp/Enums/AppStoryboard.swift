//
//  AppStoryboard.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard : String {
	
	case main = "Main"
	case launchScreen = "LaunchScreen"
	
	var instance : UIStoryboard {
		return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
	}
	
	func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T? {
		let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
		return instance.instantiateViewController(withIdentifier: storyboardID) as? T
	}
	
	func initialViewController() -> UIViewController? {
		return instance.instantiateInitialViewController()
	}
	
}
