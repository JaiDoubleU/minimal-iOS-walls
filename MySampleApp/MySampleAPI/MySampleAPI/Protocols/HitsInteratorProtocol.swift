//
//  HitsInteratorProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

public protocol HitsInteractorProtocol {
	func fetchHits(_ completionHandler: @escaping (Result<[Hit], NetworkError>) -> Void)
	func downloadImage(_ completionHandler: @escaping ((Result<Data, NetworkError>) -> Void))
}
