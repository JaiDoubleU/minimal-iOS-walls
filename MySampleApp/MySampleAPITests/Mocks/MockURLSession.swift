//
//  MockURLSession.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

@testable import MySampleAPI

//MARK: MOCK
class MockURLSession: URLSessionProtocol {
	
	var nextDataTask = MockURLSessionDataTask()
	var nextData: Data?
	var nextError: Error?
	
	private (set) var lastURL: URL?
	
	func successHttpURLResponse(request: URLRequest) -> URLResponse {
		return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
	}
	
	func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
		lastURL = request.url
		
		completionHandler(nextData, successHttpURLResponse(request: request), nextError)
		return nextDataTask as URLSessionDataTaskProtocol
	}
	
}
