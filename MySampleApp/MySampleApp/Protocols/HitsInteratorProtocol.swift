//
//  HitsInteratorProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

protocol HitsInteractorProtocol {
	func fetchHits(_ completionBlock: @escaping (Result<[Hit], Error>) -> Void)
}
