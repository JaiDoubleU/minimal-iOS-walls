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
	
	typealias DownloadImageCompleteHandler = ( Result<UIImage, NetworkError> ) -> Void
	
	func downloadImage(urlSession: URLSessionProtocol = URLSession(configuration: URLSessionConfiguration.default),
					   urlString: String,
					   placeHolder: UIImage? = nil,
					   completionHandler: DownloadImageCompleteHandler?)  {
		guard let url = URL(string: urlString) else {
			completionHandler?(.failure(NetworkError.badURL))
			return
		}
		
		image = placeHolder ?? nil
		
		if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
			animateTransition(to: imageFromCache)
			completionHandler?(.success(imageFromCache))
		}
		
		urlSession.dataTask(with: URLRequest(url: url)) { [weak self] (data, response, error) in
			
			if let error = error {
				completionHandler?(.failure(.apiError(error: error)))
			} else if let data = data {
				DispatchQueue.main.async {
					if let imageToCache = UIImage(data: data) {
						imageCache.setObject(imageToCache, forKey: urlString as NSString)
						self?.animateTransition(to: imageToCache)
						completionHandler?(.success(imageToCache))
					}
				}
			} else {
				completionHandler?(.failure(NetworkError.emptyData))
			}
			
			
		}.resume()
	}
	
}
