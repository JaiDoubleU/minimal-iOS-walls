//
//  AppCoordinator.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
import UIKit
import MySampleAPI

/// AppCoordinator has the responsibility of handling the navigate between screens and create new calçots where needed
final class AppCoordinator: CoordinatorProtocol {
	
	private var window: UIWindow
	
	/// AppCoordinator should be the first coordinator your app calls
	///
	/// - Parameter window: AppDelegate window
	init?(_ window: UIWindow?) {
		guard let uwWindow = window else {
			return nil
		}
		self.window = uwWindow
	}
		
	/// Start routing
	func start() {
		// App theme
		ThemeManager.applyTheme()
		
		// initial storyboard. in our case Hits view Controller
		guard let hitsViewController = HitsViewController.instantiateFromAppStoryboard(appStoryboard: AppStoryboard.main) else { return }		
		let navigationController = UINavigationController(rootViewController: hitsViewController)
		let iterator = HitsInteractor()
		let viewModel = HitsViewModel(interactor: iterator, coordinator: self)
		hitsViewController.viewModel = viewModel
		
		// establishing the window.rootVC
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
	
	/// Handle when HitsViewController is finished
	func finish() {
		// Do something here (the app is very small but I would probably use this method very soon, temporally breaking a SOLID principle
	}

}
