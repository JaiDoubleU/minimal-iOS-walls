//
//  MockCoordinatorProtocol.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 14/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
@testable import MySampleAPI
@testable import MySampleApp

struct MockCoordinator: HitsCoordinatorProtocol {
	func start() {
	}
	
	func present(hit: Hit) {		
	}
	
	func finish() {
	}
}
