//
//  HitCollectionCellViewModel.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit
import MySampleAPI

/// HitCollectionCellViewModel contains presentation logic for preparing data to be shown by the CellView
struct HitCollectionCellViewModel: HitCollectionCellViewModelProtocol {
	
	private (set) var interactor: HitsInteractorProtocol
	private (set) var model: Hit
	
	var titleText: String {
		return "\(model.id)"
	}
	
	var imageIdentifier: String {
		return model.previewURL
	}
	
	var placeHolderImage: UIImage? {
		return UIImage(named: "imagePlaceholder")
	}
	
	init(interactor: HitsInteractorProtocol, model: Hit) {
		self.interactor = interactor
		self.model = model
	}
	
}
