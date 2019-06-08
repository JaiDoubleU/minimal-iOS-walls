//
//  NetworkError.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

enum NetworkError: Error {
	case badURL
	case unknownError
	case emptyData
	case apiError(error: Error)
}

extension NetworkError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .badURL:
			return NSLocalizedString("network_error_bad_url", comment:"Bad url")
		case .unknownError:
			return NSLocalizedString("network_error_unkown", comment:"Unknown error, please try again")
		case .emptyData:
			return NSLocalizedString("network_error_empty_data", comment: "Error: did not receive data")
		case .apiError:
			return NSLocalizedString("network_error_api_error", comment: "Error: did receive an error from the API")
		}
	}
}
