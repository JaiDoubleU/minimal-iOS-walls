//
//  ThemeColor.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit

/// Color Scheme Helper
enum Color {
	case theme
	case border
	case shadow
	
	case darkBackground
	case lightBackground
	case intermidiateBackground
	
	case darkText
	case lightText
	case intermidiateText
	
	case affirmation
	case negation
	
	case custom(hexString: String, alpha: Double)
	
	func withAlpha(_ alpha: Double) -> UIColor {
		return self.value.withAlphaComponent(CGFloat(alpha))
	}
}
