//
//  UIViewController+StoryboardInstance.swift
//  MySampleApp
//
//  Created by Alex Núñez on 15/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

// MARK: - Allows to instantiate a viewContoller from the Storyboard
extension UIViewController {
	static func instantiateFromAppStoryboard(appStoryboard: AppStoryboard) -> Self? {
		return appStoryboard.viewController(viewControllerClass: self)
	}
}