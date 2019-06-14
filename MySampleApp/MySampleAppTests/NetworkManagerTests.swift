//
//  NetworkManagerTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import XCTest

@testable import MySampleApp

class NetworkManagerTests: XCTestCase {
	
	var session: MockURLSession!
	var networkModel: MockNetworkModel!
	var networkManager: NetworkManager!
	
	override func setUp() {
		super.setUp()
		
		session = MockURLSession()
		networkModel = MockNetworkModel(base: PixabayNetworkServiceUrl.apiBase,
										path: PixabayNetworkServiceUrl.apiPath,
										params: nil,
										headers: nil,
										method: .get)
		networkManager = NetworkManager(networkModel: networkModel, session: session)
	}
	
	override func tearDown() {
		super.tearDown()
		session = nil
		networkModel = nil
		networkManager = nil
	}
	
	func test_execute_withURL_shouldHaveSessionURL() {
		guard let url = URL(string: "https://pixabay.com/api/") else {
			fatalError("URL can't be empty")
		}
		
		networkManager.execute { (result) in
		}
		
		XCTAssert(session.lastURL == url)
	}
	
	func test_execute_withNoData_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Get request")
		
		networkManager.execute { (result) in
			switch result {
			case .failure( _):
				expectation.fulfill()
			case .success(let data):
				XCTAssertNotNil(data, "We shouldn't get an data")
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_execute_shouldCallResume() {
		let dataTask = MockURLSessionDataTask()
		session.nextDataTask = dataTask
		
		networkManager.execute { (result) in
		}
		
		XCTAssert(dataTask.resumeWasCalled)
	}
	
	func test_execute_withData_shouldReturnData() {
		let expectedData = "{}".data(using: .utf8)
		session.nextData = expectedData
		
		let expectation = XCTestExpectation(description: "Get request")
		
		networkManager.execute { (result) in
			switch result {
			case .failure( _):
				XCTFail("There is an error whilst downloading data")
			case .success(let data):
				XCTAssertNotNil(data)
				expectation.fulfill()
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
}


