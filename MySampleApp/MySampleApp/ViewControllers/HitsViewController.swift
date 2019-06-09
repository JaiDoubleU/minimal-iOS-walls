//
//  HitsViewController.swift
//  MySampleApp
//
//  Created by Alex Núñez on 07/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

final internal class HitsViewController: UIViewController {

	internal var viewModel: HitsViewModelProtocol?
	
	@IBOutlet weak var hitsCollectionView: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupBond()
		setupCollectionView()
		
		viewModel?.fetchHits()
	}
	
	func setupCollectionView() {
	}
	
	func updateUI() {
		self.hitsCollectionView.reloadData() // TODO improve this in the next version
	}
	
	func setupBond() {
//		viewModel.refreshing.bind(to: viewController.activityIndicator.reactive.isAnimating)
		
		viewModel?.listData.bind(to: self) { strongSelf, _ in
			strongSelf.updateUI()
		}
		
		viewModel?.error.bind(to: self) { strongSelf, _ in
			guard let error = strongSelf.viewModel?.error.value else { return }
			strongSelf.showAlertView(title: nil, error: error)
		}
	}

}

// MARK: UICollectionViewDataSource
extension HitsViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel?.listData.value.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HitCollectionViewCell.reuseIdentifier, for: indexPath) as! HitCollectionViewCell
		
		if let model = viewModel?.listData.value[indexPath.row] {			
			let collectionViewModel = HitCollectionCellViewModel(model: model)
			cell.configure(viewModel: collectionViewModel)
		}
		
		return cell
	}
}


// MARK: UICollectionViewDelegate
extension HitsViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(indexPath.item + 1)
	}
}
