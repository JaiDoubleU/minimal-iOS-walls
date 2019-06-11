//
//  NetworkModel.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

struct NetworkModel: NetworkModelProtocol {
	let base: String
	let path: String?
	let params: [URLQueryItem]?
	let headers: NetworkHeadersProtocol?
	let method: HTTPMethod
}
