//
//  HitCollectionCellViewModel.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

struct HitCollectionCellViewModel: HitCollectionCellViewModelProtocol {
	
	private (set) var model: Hit
	
	var titleText: String {
		return "\(model.id)"
	}
	
	var imageUrl: String {
		return model.previewURL
	}
	
	init(model: Hit) {
		self.model = model
	}
	
}
