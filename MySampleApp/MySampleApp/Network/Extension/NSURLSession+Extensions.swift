//
//  NSURLSession+Extensions.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

//MARK: Conform the protocol
extension URLSession: URLSessionProtocol {
	func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
		return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
	}
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {
}
