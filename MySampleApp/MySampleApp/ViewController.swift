//
//  ViewController.swift
//  MySampleApp
//
//  Created by Alex Núñez on 07/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var networkService: PixabayNetworkService?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		networkService = PixabayNetworkService()
		networkService?.getHits({ [weak self] (result) in
			switch result {
			case .success(let models):
				print(models)
			case .failure(let error):
				self?.showAlertView(title: LocalizableStrings.genericError.localized, error: error)
			}
		})
	}

}

