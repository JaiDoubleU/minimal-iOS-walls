//
//  NetworkModel.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

/// NetworkModel object
public struct NetworkModel: NetworkModelProtocol {
	
	/// base string url, i.e "http://yourwebsite.com"
	public let base: String
	
	/// path or endpoint i.e. "/api/"
	public let path: String?
	
	/// URLQueryItem params
	public let params: [URLQueryItem]?
	
	/// NetworkHeadersProtocol object that contains a dictionary [String: String] with your headers
	public let headers: NetworkHeadersProtocol?
	
	/// .post, .get...
	public let method: HTTPMethod
	
	/// NetworkModel object
	///
	/// - Parameters:
	///   - base: base string url, i.e "http://yourwebsite.com"
	///   - path: path i.e. "/api/"
	///   - params: URLQueryItem params
	///   - headers: NetworkHeadersProtocol object that contains a dictionary [String: String] with your headers
	///   - method: .post, .get...
	public init(base: String,
				path: String? = nil,
				params: [URLQueryItem]? = nil,
				headers: NetworkHeadersProtocol? = nil,
				method: HTTPMethod) {
		self.base = base
		self.path = path
		self.params = params
		self.headers = headers
		self.method = method
	}
	
}
