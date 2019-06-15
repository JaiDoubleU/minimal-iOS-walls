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
	
	lazy var activityIndicator: UIActivityIndicatorView = {
		let indicatorView = UIActivityIndicatorView(style: .gray)
		indicatorView.hidesWhenStopped = true
		return indicatorView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupActivityIndicator()
		setupBond()
		setupCollectionVew()
		updateUI()
		
		viewModel?.fetchHits()
	}

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
	
	func setupBond() {
		viewModel?.refreshing.bind(to: activityIndicator.reactive.isAnimating)
		
		viewModel?.listData.bind(to: self) { strongSelf, _ in
			strongSelf.updateUI()
		}
		
		viewModel?.error.bind(to: self) { strongSelf, _ in
			guard let error = strongSelf.viewModel?.error.value else { return }
			strongSelf.showAlertView(title: nil, error: error)
		}
	}
		
	func updateUI() {
		title = viewModel?.title
		hitsCollectionView.reloadData()
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
