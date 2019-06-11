//
//  HitCollectionCellViewModelProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

protocol HitCollectionCellViewModelProtocol {
	var model: Hit { get }
	var titleText: String { get }
	var imageUrl: String { get }
}
