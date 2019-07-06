//
//  NetworkError.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

/// Network errors
///
/// - badURL: the url is not correct or empty
/// - unknownError: not possible to determine what's the specific error
/// - emptyData: no data
/// - apiError: api error data with Error attached
public enum NetworkError: Error {
	case badURL
	case unknownError
	case emptyData
	case dataToImageError
	case apiError(error: Error)
}

// MARK: - Allows to compare errors, useful for testing
extension NetworkError: Equatable {
	public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
		return lhs.errorDescription == rhs.errorDescription
	}
}

extension NetworkError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .badURL:
			return "Bad url";
		case .unknownError:
			return "Unknown error, please try again"
		case .emptyData:
			return "Error: did not receive data"
		case .apiError:
			return "Error: did receive an error from the API"
		case .dataToImageError:
			return "There was an error converting to image object"
		}
	}
}
