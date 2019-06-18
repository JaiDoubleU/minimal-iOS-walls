//
//  NetworkModel.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

/// NetworkModel object
struct NetworkModel: NetworkModelProtocol {
	
	/// base string url, i.e "http://yourwebsite.com"
	let base: String
	
	/// path i.e. "/api/"
	let path: String?
	
	/// URLQueryItem params
	let params: [URLQueryItem]?
	
	/// NetworkHeadersProtocol object that contains a dictionary [String: String] with your headers
	let headers: NetworkHeadersProtocol?
	
	/// .post, .get...
	let method: HTTPMethod
}
