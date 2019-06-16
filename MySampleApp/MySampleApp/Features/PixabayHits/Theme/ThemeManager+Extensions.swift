//
//  ThemeManager+Extensions.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

// MARK: - Specific theme scheme for Pixabay
struct ThemeManager: ThemeManagerProtocol {
	
	static func applyTheme() {
		setupNavigationBar()
	}
	
	static internal func setupNavigationBar() {
		// Navigation bar
		UINavigationBar.appearance().barTintColor = Color.darkBackground.value
		UINavigationBar.appearance().tintColor = Color.lightText.value
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Color.lightText.value]
		UINavigationBar.appearance().isTranslucent = false
	}
	
}
