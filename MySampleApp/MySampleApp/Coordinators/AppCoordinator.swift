//
//  AppCoordinator.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
	
	private var window: UIWindow
	
	init?(_ window: UIWindow?) {
		guard let uwWindow = window else {
			return nil
		}
		self.window = uwWindow
	}
	
	func start() {
		// App theme
		ThemeManager.applyTheme()
		
		guard let hitsViewController = HitsViewController.instantiateFromAppStoryboard(appStoryboard: AppStoryboard.main) else { return }		
		let navigationController = UINavigationController(rootViewController: hitsViewController)
		let iterator = HitsInteractor()
		let viewModel = HitsViewModel(interactor: iterator, coordinator: self)
		hitsViewController.viewModel = viewModel
		window.rootViewController = navigationController
	}
	
	func finish() {
		// Do something (the app is very small but I would probably use this method very soon, temporally breaking SOLID principle
	}

}
