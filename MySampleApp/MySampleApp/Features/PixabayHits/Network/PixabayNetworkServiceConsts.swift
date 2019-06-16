//
//  PixabayNetworkServiceConsts.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

enum PixabayNetworkServiceUrls {
	#if DEBUG
	static let apiBase = "https://pixabay.com"					// We don't have a debug api yet
	#else
	static let apiBase = "https://pixabay.com"
	#endif
	
	static let apiPath = "/api/"
}

enum PixabayNetworkServiceKeys {
	// TODO save this in a safer place in the future
	#if DEBUG
	static let apiKey = "12718350-529ce9e3755c0dc2e7ff99c03" 	// We don't have a debug api key yet
	#else
	static let apiKey = "12718350-529ce9e3755c0dc2e7ff99c03"
	#endif
}
