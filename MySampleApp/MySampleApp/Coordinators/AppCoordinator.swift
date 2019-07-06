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
final class AppCoordinator {
	
	static func presentHits() -> UINavigationController {
		
		// Preparing the new calçot
		
		// initial storyboard. in our case Hits view Controller
		guard let hitsViewController = HitsViewController.instantiateFromAppStoryboard(appStoryboard: AppStoryboard.main) else { return UINavigationController()}
		let navigationController = UINavigationController(rootViewController: hitsViewController)
		
		let hitsCoordinator = HitsCoordinator(navigationController: navigationController)
		let iterator = HitsInteractor()
		let viewModel = HitsViewModel(interactor: iterator, coordinator: hitsCoordinator)
		hitsViewController.viewModel = viewModel
		hitsCoordinator.start()
		
		return navigationController
	}
	
	
}
