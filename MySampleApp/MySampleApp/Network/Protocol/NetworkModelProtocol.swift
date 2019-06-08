//
//  NetworkProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

protocol NetworkModelProtocol {
	var base: String { get }
	var path: String? { get }
	var params: [URLQueryItem]? { get }
	var headers: NetworkHeadersProtocol? { get }
	var method: HTTPMethod { get }
}
