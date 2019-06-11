//
//  UIViewController+StoryboardId.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

extension UIViewController {
	class var storyboardID : String {
		return "\(self)"
	}
}

extension UIViewController {	
	static func instantiateFromAppStoryboard(appStoryboard: AppStoryboard) -> Self? {
		return appStoryboard.viewController(viewControllerClass: self)
	}
}
