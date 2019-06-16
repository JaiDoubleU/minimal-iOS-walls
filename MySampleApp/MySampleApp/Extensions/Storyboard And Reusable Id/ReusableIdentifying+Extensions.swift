//
//  ReusableIdentifying+Extensions.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

// MARK: - Use for TableViews and Collections views, it will return the reuseIdentity. always use the name of the class as identifier to make this work
extension ReuseIdentifying {
	
	/// reuseIdentifer, we are asusming it's the same name as the class
	static var reuseIdentifier: String {
		return String(describing: Self.self)
	}
}
