//
//  UIImageView+Animations.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit

extension UIImageView {
	
	/// animate the transition between and old image and a new one
	///
	/// - Parameter image: animates the transition between images with a set animation, transitionFlipFromBottom with a duration of 0.75, we can expand this method for allowing customization in the future
	func animateTransition(to image: UIImage) {
		UIView.transition(with: self,
						  duration: 0.75,
						  options: .transitionFlipFromBottom,
						  animations: { self.image = image },
						  completion: nil)
	}
}
