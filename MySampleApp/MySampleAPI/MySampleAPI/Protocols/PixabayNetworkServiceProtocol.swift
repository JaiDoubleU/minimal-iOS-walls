//
//  PixabayNetworkServiceProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

public protocol PixabayNetworkServiceProtocol {	
	func getHits(_ completionHandler: @escaping ((Result<[Hit], NetworkError>) -> Void))
	func downloadImage(_ completionHandler: @escaping ((Result<UIImage, NetworkError>) -> Void))
	func decode(data: Data, completionHandler: ((Result<[Hit], NetworkError>) -> Void))
}
