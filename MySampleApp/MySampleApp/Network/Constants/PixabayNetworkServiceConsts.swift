//
//  PixabayNetworkServiceConsts.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

struct PixabayNetworkServiceUrl {
	
	#if DEBUG
	static let apiBase = "https://pixabay.com"					// We don't have a debug api yet so we are using the same
	#else
	static let apiBase = "https://pixabay.com"
	#endif
	
	static let apiPath = "/api/"
}

struct PixabayNetworkServiceApi {
	
	#if DEBUG
	static let apiKey = "12718350-529ce9e3755c0dc2e7ff99c03" // We don't have a debug api yet so we are using the same
	#else
	static let apiKey = "12718350-529ce9e3755c0dc2e7ff99c03"
	#endif
}
