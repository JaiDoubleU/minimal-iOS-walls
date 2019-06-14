//
//  UIImageView+Download.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit

// NSCache this is just for tis basic app. for a real app we should have a better approach
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
	
	func downloadImage(urlSession: URLSessionProtocol = URLSession(configuration: URLSessionConfiguration.default),
					   urlString: String,
					   placeHolder: UIImage?) {
		guard let url = URL(string: urlString) else { return }
		
		image = placeHolder ?? nil
		
		if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
			animateTransition(to: imageFromCache)
			return
		}
		
		urlSession.dataTask(with: URLRequest(url: url)) { [weak self] (data, response, error) in
			if let data = data {
				DispatchQueue.main.async {
					if let imageToCache = UIImage(data: data) {
						imageCache.setObject(imageToCache, forKey: urlString as NSString)
						self?.animateTransition(to: imageToCache)
					}
				}
			}
		}.resume()
	}
	
}
