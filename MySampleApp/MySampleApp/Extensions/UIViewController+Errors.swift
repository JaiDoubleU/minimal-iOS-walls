//
//  UIViewController+Errors.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	
	/// shows an alert view
	///
	/// - Parameters:
	///   - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
	///   - message: Descriptive text that provides additional details about the reason for the alert.
	///   - handler: notifies when the user clicks OK
	func showAlertView(title: String, message: String, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
		let alertController = UIAlertController(
			title: title,
			message: message,
			preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: LocalizableStrings.genericOk.localized, style: .default, handler: handler)
		
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion: nil)
	}
		
	/// shows an alert view with an error type
	///
	/// - Parameters:
	///   - title: The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.  LocalizableStrings.genericError.localized by default
	///   - error: it will should localizedDescription as message
	///   - handler: notifies when the user clicks OK
	func showAlertView(title: String?, error: Error, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
		showAlertView(title: title ?? LocalizableStrings.genericError.localized, message: error.localizedDescription)
	}
}
