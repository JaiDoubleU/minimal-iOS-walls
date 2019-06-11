//
//  ThemeManager+Extensions.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

struct ThemeManager: ThemeManagerProtocol {
	
	static func applyTheme() {
		setupNavigationBar()
	}
	
	static func setupNavigationBar() {
		// Navigation bar
		UINavigationBar.appearance().barStyle = UIBarStyle.default
		UINavigationBar.appearance().tintColor = Color.darkBackground.value
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : Color.lightText.value, NSAttributedString.Key.font: Font.large(bold: true)]
		UINavigationBar.appearance().isTranslucent = false
	}
	
}
