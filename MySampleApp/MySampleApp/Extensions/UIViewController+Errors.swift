//
//  UIViewController+Errors.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	
	func showAlertView(title: String, message: String, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
		let alertController = UIAlertController(
			title: title,
			message: message,
			preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: NSLocalizedString("Ok", comment: "Close button"), style: .default, handler: handler)
		
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion: nil)
	}
	
	func showAlertView(title: String?, error: Error, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
		showAlertView(title: title ?? "Error", message: error.localizedDescription)
	}
}
