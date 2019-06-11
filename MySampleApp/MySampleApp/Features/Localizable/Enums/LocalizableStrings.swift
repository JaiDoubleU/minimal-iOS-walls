//
//  LocalizableStrings.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

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
