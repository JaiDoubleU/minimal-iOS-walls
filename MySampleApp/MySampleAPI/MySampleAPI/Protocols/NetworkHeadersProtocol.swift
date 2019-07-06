//
//  NetworkHeadersProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

public protocol NetworkHeadersProtocol {
	var headers: [String: String] { get }
}
