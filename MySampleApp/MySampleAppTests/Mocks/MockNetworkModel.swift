//
//  MockNetworkModel.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

@testable import MySampleApp

struct MockNetworkModel: NetworkModelProtocol {
	let base: String
	let path: String?
	let params: [URLQueryItem]?
	let headers: NetworkHeadersProtocol?
	let method: HTTPMethod
}
