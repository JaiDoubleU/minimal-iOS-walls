//
//  Localizable+Extensions.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
	var localized: String {
		return rawValue.localized(tableName: tableName)
	}
}
