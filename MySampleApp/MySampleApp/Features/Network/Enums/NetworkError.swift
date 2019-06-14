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

extension NetworkError: Equatable {
	static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
		return lhs.errorDescription == rhs.errorDescription
	}
}

extension NetworkError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .badURL:
			return LocalizableStrings.badUrl.localized
		case .unknownError:
			return LocalizableStrings.unknownError.localized
		case .emptyData:
			return LocalizableStrings.emptyData.localized
		case .apiError:
			return LocalizableStrings.apiError.localized
		}
	}
}
