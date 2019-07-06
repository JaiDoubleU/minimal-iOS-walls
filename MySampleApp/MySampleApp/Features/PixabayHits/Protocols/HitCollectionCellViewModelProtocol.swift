//
//  HitCollectionCellViewModelProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
import UIKit
import MySampleAPI

protocol HitCollectionCellViewModelProtocol {
	var interactor: HitsInteractorProtocol { get }
	var model: Hit { get }
	var titleText: String { get }
	var imageIdentifier: String { get }
	var placeHolderImage: UIImage? { get }
}
