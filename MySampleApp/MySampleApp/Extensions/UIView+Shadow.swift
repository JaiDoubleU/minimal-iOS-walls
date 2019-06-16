//
//  UIView+Shadow.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

extension UIView {
	
	/// adds a shadow to a view with a given radius
	@IBInspectable
	var shadowRadius: CGFloat {
		get {
			return layer.shadowRadius
		}
		set {
			layer.shadowColor = UIColor.black.cgColor
			layer.shadowOffset = CGSize(width: 0, height: 0)
			layer.shadowOpacity = 0.4
			layer.shadowRadius = shadowRadius
			clipsToBounds = false
		}
	}
	
	/// helper method for applying a shadow radius
	///
	/// - Parameter shadowRadius: CGFloat by default 5
	func applyShadow(shadowRadius: CGFloat = 5) {
		self.shadowRadius = shadowRadius
	}

}
