//
//  HitCollectionView.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit
import MySampleAPI

/// Simple Collection View Cell that shows and image and a label with information about the hit image model
final internal class HitCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var hitImageView: UIImageView!
	@IBOutlet weak var hitLabel: UILabel!
	
	private (set) var viewModel: HitCollectionCellViewModelProtocol?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		applyTheme()
		setupTapGesture()
	}
	
	/// Sets the UI theme for the labels and image view
	private func applyTheme() {
		hitLabel.textColor = Color.darkText.value
		hitLabel.font = Font.normal(bold: true).value
		hitImageView.applyShadow()
	}
	
	
	/// Addes a tap gesture to the hitImageView, but it doesn't cancel the touches in view
	private func setupTapGesture() {
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hitImageViewTapped(tapGestureRecognizer:)))
		tapGestureRecognizer.cancelsTouchesInView = false
		hitImageView.isUserInteractionEnabled = true
		hitImageView.addGestureRecognizer(tapGestureRecognizer)
	}
	
	
	/// HitCollectionCellViewModelProtocol
	///
	/// - Parameter viewModel: it will set the labels and imageviews according to the pass view model
	internal func configure(viewModel: HitCollectionCellViewModelProtocol) {
		self.viewModel = viewModel
		hitLabel.text = viewModel.titleText
		
		// starts downloading the image
		hitImageView.downloadImage(interactor: viewModel.interactor, imageIdentifier: viewModel.imageIdentifier, completionHandler: nil)
	}
	
	/// Tap recognizer
	///
	/// - Parameter tapGestureRecognizer: the image will shake when it's tapped
	@objc private func hitImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
		if let tappedImage = tapGestureRecognizer.view as? UIImageView {
			tappedImage.shake()
		}
	}
}

// MARK: - ReuseIdentifying
extension HitCollectionViewCell: ReuseIdentifying {
}

