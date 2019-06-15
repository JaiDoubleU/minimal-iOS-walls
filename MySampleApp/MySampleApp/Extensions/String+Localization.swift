//
//  String+Localization.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

// MARK: - Allows to extract strings from the localized file
extension String {
	
	/// Allows to extract strings from the localized file
	///
	/// - Parameters:
	///   - bundle: buble of your application, main by default
	///   - tableName: Localizable by default
	/// - Returns: string from the localized file
	func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
		return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
	}
}
