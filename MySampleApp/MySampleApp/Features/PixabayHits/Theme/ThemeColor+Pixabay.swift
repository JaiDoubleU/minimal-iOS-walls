//
//  ThemeColor+Pixabay.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

// MARK: - Specific color scheme for Pixabay
extension Color {
	
	var value: UIColor {
		var instanceColor = UIColor.clear
		
		switch self {
		case .border:
			instanceColor = UIColor(hexString: "#333333")
		case .theme:
			instanceColor = UIColor(hexString: "#ffcc00")
		case .shadow:
			instanceColor = UIColor(hexString: "#cccccc")
		case .darkBackground:
			instanceColor = UIColor(hexString: "#212E53")
		case .lightBackground:
			instanceColor = UIColor(hexString: "#cccc66")
		case .intermidiateBackground:
			instanceColor = UIColor(hexString: "#cccc99")
		case .darkText:
			instanceColor = UIColor(hexString: "#333333")
		case .intermidiateText:
			instanceColor = UIColor(hexString: "#999999")
		case .lightText:
			instanceColor = UIColor(hexString: "#cccccc")
		case .affirmation:
			instanceColor = UIColor(hexString: "#00ff66")
		case .negation:
			instanceColor = UIColor(hexString: "#ff3300")
		case .custom(let hexValue, let opacity):
			instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
		}
		return instanceColor
	}
}
