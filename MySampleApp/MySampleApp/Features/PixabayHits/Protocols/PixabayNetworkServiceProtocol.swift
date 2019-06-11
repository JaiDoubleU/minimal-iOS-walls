//
//  PixabayNetworkServiceProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

protocol PixabayNetworkServiceProtocol {
	var networkManager: NetworkManager { get }
	func getHits(_ completionHandler: @escaping ((Result<[Hit], Error>) -> Void))
	func decode(data: Data, completionHandler: ((Result<[Hit], Error>) -> Void))
}
