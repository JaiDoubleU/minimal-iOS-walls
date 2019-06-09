//
//  HitsViewModelProtocols.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import Bond

protocol HitsViewModelProtocol {
	var interactor: HitsInteractorProtocol { get }
	var coordinator: CoordinatorProtocol { get }
	
	var listData: Observable<[Hit]> { get }
	var error: Observable<Error?> { get }
	var refreshing: Observable<Bool> { get }
	func fetchHits()
}
