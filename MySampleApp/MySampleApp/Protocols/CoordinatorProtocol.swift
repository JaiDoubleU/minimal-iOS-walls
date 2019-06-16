//
//  CoordinatorProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

/// Common coordinator
protocol CoordinatorProtocol {
	
	/// Usually creates viewController, interactor, viewModel objects and displays the view controller
	func start()
	
	/// A view controller is ready to be dismissed
	func finish()
}
