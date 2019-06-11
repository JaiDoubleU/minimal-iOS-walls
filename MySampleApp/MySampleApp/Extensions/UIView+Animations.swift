//
//  UIView+Animations.swift
//  MySampleApp
//
//  Created by Alex Núñez on 11/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

extension UIView {
	
	@discardableResult func shake(amount: CGFloat = 0.15,
								  duration: TimeInterval = 0.6,
								  delay: TimeInterval = 0,
								  completion: ((Bool) -> Void)? = nil) -> UIView {
		let steps = 8
		let timeStep = 1.0 / Double(steps)
		var dx: CGFloat = 0
		var dy: CGFloat = 1 * self.bounds.size.height * amount;

		UIView.animateKeyframes(
			withDuration: duration, delay: delay, options: .calculationModeCubic, animations: {
				var start = 0.0
				for i in 0..<(steps - 1) {
					UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: timeStep) {
						self.transform = CGAffineTransform(translationX: dx, y: dy)
					}
					if (i % 2 == 0) {
						swap(&dx, &dy)  // Change direction
						dy *= -1
					}
					dx *= -0.85
					dy *= -0.85
					start += timeStep
				}
				UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: timeStep) {
					self.transform = .identity
				}
		}, completion: completion)
		return self
	}
}
