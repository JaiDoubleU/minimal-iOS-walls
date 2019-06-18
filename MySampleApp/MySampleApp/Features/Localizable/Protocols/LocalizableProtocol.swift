//
//  LocalizableProtocol.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

/// Localizable Protocol
protocol LocalizableProtocol {
	
	/// Localizable by default
	var tableName: String { get }
	
	// Localized string
	var localized: String { get }
}

