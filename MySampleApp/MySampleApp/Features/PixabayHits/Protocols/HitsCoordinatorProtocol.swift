//
//  HitsCoordinatorProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 06/07/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import MySampleAPI

protocol HitsCoordinatorProtocol: CoordinatorProtocol {
	func start()
	func present(hit: Hit)
	func finish()
}
