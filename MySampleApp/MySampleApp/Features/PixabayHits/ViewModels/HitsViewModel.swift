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

/// HitsViewModels contains presentation logic for preparing data to be shown by the View
final class HitsViewModel: HitsViewModelProtocol {
	
	internal var interactor: HitsInteractorProtocol
	internal let coordinator: CoordinatorProtocol
	
	internal var listData = Observable<[Hit]>([])
	internal var error = Observable<Error?>(nil)
	internal var refreshing = Observable<Bool>(false)
	
	///
	///
	/// - Parameters:
	///   - interactor: hits model
	///   - coordinator: instance of the coordinator
	init(interactor: HitsInteractorProtocol, coordinator: CoordinatorProtocol) {
		self.interactor = interactor
		self.coordinator = coordinator
	}
	
	/// Navigation Bar Title
	var title: String {
		return "Pixabay Hits"
	}
	
	/// Calls the iterator and update the listdata with the new models
	func fetchHits() {
		refreshing.value = true
		
		interactor.fetchHits({ [weak self] (result) in
			self?.refreshing.value = false
			
			switch result {
			case .success(let models):
				self?.listData.value = models
			case .failure(let error):
				self?.error.value = error
			}
		})
	}
	
	/// numberOfItems
	///
	/// - Returns: return the number of items of listdata
	func numberOfItems() -> Int {
		return listData.value.count
	}
	
	/// numberOfSections
	///
	/// - Returns: Returns the number of sections
	func numberOfSections() -> Int {
		return 1
	}
	
	/**
	Returns the item at the specified index path.
	- Parameter indexPath: The index path locating the item in the list.
	- Returns: An object representing an item of the list.
	*/
	func viewModelForItem(at indexPath: IndexPath) -> HitCollectionCellViewModelProtocol {
		let model = listData.value[indexPath.row]
		return HitCollectionCellViewModel(model: model)
	}
	
	/// Dimiss action, it notifices teh coordinator when we are finished
	func finish() {
		coordinator.finish()
	}
}

