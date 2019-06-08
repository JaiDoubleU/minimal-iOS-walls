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
		networkService?.fetchData()
	}


}

