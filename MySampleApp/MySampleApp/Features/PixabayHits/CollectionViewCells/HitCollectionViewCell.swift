//
//  HitCollectionView.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import UIKit

internal class HitCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var hitImageView: UIImageView!
	@IBOutlet weak var hitLabel: UILabel!
	
	private (set) var viewModel: HitCollectionCellViewModelProtocol?
	
	internal func configure(viewModel: HitCollectionCellViewModelProtocol) {
		self.viewModel = viewModel
		hitLabel.text = viewModel.titleText		
		hitImageView.downloadImage(urlString: viewModel.imageUrl, placeHolder: viewModel.placeHolderImage)
		
		applyTheme()
	}
	
	private func applyTheme() {
		hitLabel.textColor = Color.darkText.value
		hitLabel.font = Font.normal(bold: true).value
		hitImageView.applyShadow()
	}
	
}

extension HitCollectionViewCell: ReuseIdentifying {		
}

