//
//  HitsCoordinator.swift
//  MySampleApp
//
//  Created by Alex Núñez on 06/07/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import UIKit

import MySampleAPI

class HitsCoordinator: HitsCoordinatorProtocol {
	
	private weak var navigationController: UINavigationController?
	
	init(navigationController: UINavigationController?) {
		self.navigationController = navigationController
	}
	
	func start() {
	}
	
	func present(hit: Hit) {
		// TODO
		// Navigate to the new screen
		// navigationController?.pushViewController(groupViewController, animated: true)
	}
	
	func finish() {
		navigationController?.popViewController(animated: true)
	}
}
