//
//  HitCollectionView.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import UIKit

class HitCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var hitImageView: UIImageView!
	@IBOutlet weak var hitLabel: UILabel!
	
	private (set) var viewModel: HitCollectionCellViewModelProtocol?
	
	func configure(viewModel: HitCollectionCellViewModelProtocol) {
		self.viewModel = viewModel
		hitLabel.text = viewModel.titleText
		hitImageView.downloadImage(urlString: viewModel.imageUrl)
	}
	
}

extension HitCollectionViewCell: ReuseIdentifying {		
}

