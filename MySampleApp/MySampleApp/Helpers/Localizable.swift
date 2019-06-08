//
//  Localizable.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

protocol Localizable {
	var tableName: String { get }
	var localized: String { get }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
	var localized: String {
		return rawValue.localized(tableName: tableName)
	}
}

enum LocalizableStrings: String, Localizable {
	case genericOk = "ok"
	case genericError = "error"
	case badUrl = "network_error_bad_url"
	case unknownError = "network_error_unknown"
	case emptyData = "network_error_empty_data"
	case apiError = "network_error_api_error"
	
	var tableName: String {
		return "Localizable"
	}
}
