//
//  UIImageView+Animations.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

extension UIImageView {
	
	func animateTransition(to image: UIImage) {
		UIView.transition(with: self,
						  duration: 0.75,
						  options: .transitionFlipFromBottom,
						  animations: { self.image = image },
						  completion: nil)
	}
}
