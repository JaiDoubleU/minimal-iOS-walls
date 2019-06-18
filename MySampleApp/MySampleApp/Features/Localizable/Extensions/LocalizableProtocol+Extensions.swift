//
//  LocalizableProtocol+Extensions.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

// MARK: - returns the a localized string from a table, use the file LocalizableStrings to add elements
extension LocalizableProtocol where Self: RawRepresentable, Self.RawValue == String {
	var localized: String {
		return rawValue.localized(tableName: tableName)
	}
}
