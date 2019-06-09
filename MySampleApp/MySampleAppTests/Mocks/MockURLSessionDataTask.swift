//
//  MockURLSessionDataTask.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

@testable import MySampleApp

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
	private (set) var resumeWasCalled = false
	
	func resume() {
		resumeWasCalled = true
	}
}
