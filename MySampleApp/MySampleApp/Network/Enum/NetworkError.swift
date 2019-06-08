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
	case decodeError
	case emptyData
	case apiError(error: Error)
}

extension NetworkError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .badURL:
			return NSLocalizedString("Bad url", comment: "")
		case .unknownError:
			return NSLocalizedString("Unknown error, please try again", comment: "")
		case .decodeError:
			return NSLocalizedString("Error permining the HTML query", comment: "")
		case .emptyData:
			return NSLocalizedString("Error: did not receive data", comment: "")
		case .apiError:
			return NSLocalizedString("Error: did receive an error from the API", comment: "")
		}
	}
}

