//
//  UIViewController+StoryboardId.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit


// MARK: - REturns the storyboard Id to a ViewController assuming you use the same name as the ViewController's class
extension UIViewController {
	
	class var storyboardID : String {
		return "\(self)"
	}
}
