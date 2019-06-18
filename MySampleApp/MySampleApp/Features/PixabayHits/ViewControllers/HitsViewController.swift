//
//  HitsViewController.swift
//  MySampleApp
//
//  Created by Alex Núñez on 07/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit

final internal class HitsViewController: UIViewController {

	/// Hits View Model
	internal var viewModel: HitsViewModelProtocol?
	
	@IBOutlet weak var hitsCollectionView: UICollectionView!
	
	/// Default Activity Indicator
	lazy var activityIndicator: UIActivityIndicatorView = {
		let indicatorView = UIActivityIndicatorView(style: .gray)
		indicatorView.hidesWhenStopped = true
		return indicatorView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// navigation bar title
		title = viewModel?.title
		
		// setups the ui elements: activity indicator, bond, collection view
		setupUIElements()
		
		// starts fetching
		viewModel?.fetchHits()
	}
	
	/// setup the ui elements: activity indicator, bond, collection view
	func setupUIElements() {
		setupActivityIndicator()
		setupBond()
		setupCollectionVew()
	}

	/// default activity indicator, adds it to the view and adds teh contracts
	func setupActivityIndicator() {
		view.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			])
		()
	}
	
	func setupCollectionVew() {
		hitsCollectionView.delegate = self
		hitsCollectionView.dataSource = self
	}
	
	/// Establishes the bond connections
	func setupBond() {
		viewModel?.refreshing.bind(to: activityIndicator.reactive.isAnimating)
		
		viewModel?.listData.bind(to: self) { strongSelf, _ in
			strongSelf.hitsCollectionView.reloadData()
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
		return viewModel?.numberOfSections() ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel?.numberOfItems() ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HitCollectionViewCell.reuseIdentifier, for: indexPath) as! HitCollectionViewCell
		
		// prepares the collection view model and pass it to the cell
		if let collectionViewModel = viewModel?.viewModelForItem(at: indexPath) {
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
