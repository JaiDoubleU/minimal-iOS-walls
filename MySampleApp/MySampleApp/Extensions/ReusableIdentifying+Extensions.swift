//
//  ReusableIdentifying+Extensions.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

extension ReuseIdentifying {
	static var reuseIdentifier: String {
		return String(describing: Self.self)
	}
}
