//
//  HitsViewModel.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

final class HitsViewModel: HitsViewModelProtocol {
	internal var interactor: HitsInteractorProtocol
	internal let coordinator: CoordinatorProtocol
	
	internal var listData = Observable<[Hit]>([])
	internal var error = Observable<Error?>(nil)
	internal var refreshing = Observable<Bool>(false)
	
	init(interactor: HitsInteractorProtocol, coordinator: CoordinatorProtocol) {
		self.interactor = interactor
		self.coordinator = coordinator
	}
	
	func fetchHits() {
		interactor.fetchHits({ [weak self] (result) in
			switch result {
			case .success(let models):
				self?.listData.value = models
			case .failure(let error):
				self?.error.value = error
			}
		})
	}
	
	func finish() {
		coordinator.finish()
	}
}

