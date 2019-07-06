//
//  HitsViewModelProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
import Bond
import MySampleAPI

protocol HitsViewModelProtocol {
	var interactor: HitsInteractorProtocol { get }
	var coordinator: CoordinatorProtocol { get }
	
	var title: String { get }
	var listData: Observable<[Hit]> { get }
	var error: Observable<Error?> { get }
	var refreshing: Observable<Bool> { get }
	
	func fetchHits()
	func numberOfItems() -> Int
	func numberOfSections() -> Int
	func viewModelForItem(at indexPath: IndexPath) -> HitCollectionCellViewModelProtocol
}
