//
//  ThemeFont+Pixabay.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit

enum FontFamilyType: String {
	case normal = "CourierNewPSMT"
	case bold = "CourierNewPS-BoldMT"
}

// MARK: - Specific fonts scheme for Pixabay
extension Font {
	
	static let minFontSize: CGFloat = 11.0
	
	var value: UIFont {
		switch self {
		case .veryVeryLarge(let bold):
			return getFont(with: Font.minFontSize + 12, bold)
		case .veryLarge(let bold):
			return getFont(with: Font.minFontSize + 7, bold)
		case .large(let bold):
			return getFont(with: Font.minFontSize + 5, bold)
		case .normal(let bold):
			return getFont(with: Font.minFontSize + 3, bold)
		case .small(let bold):
			return getFont(with: Font.minFontSize + 2, bold)
		case .verySmall(let bold):
			return getFont(with: Font.minFontSize, bold)
		}
	}
	
	func getFont(with size: CGFloat, _ bold: Bool = false) -> UIFont {
		let name = bold ? FontFamilyType.bold : FontFamilyType.normal
		return UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
	}
}
