//
//  URLSessionProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

// Protocol for MOCK/Real
protocol URLSessionProtocol {
	typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
	
	func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
	func resume()
}
