//
//  HTTPMethod.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

///[Online Reference](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html)
enum HTTPMethod: String {
	case get = "GET"
	case put = "PUT"
	case post = "POST"
	case delete = "DELETE"
	case head = "HEAD"
	case options = "OPTIONS"
	case trace = "TRACE"
	case connect = "CONNECT"
}
	
