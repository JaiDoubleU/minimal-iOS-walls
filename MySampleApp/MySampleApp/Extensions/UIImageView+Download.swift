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

// MARK: - Allows to async download images
extension UIImageView {
	
	typealias DownloadImageCompleteHandler = ( Result<UIImage, NetworkError> ) -> Void
	
	/// download images and save it in a NSCache
	///
	/// - Parameters:
	///   - urlSession: URLSessionProtocol
	///   - urlString: where your image is hosted i.e. http://google.com'myimage.jpg
	///   - placeHolder: this image will be shown as a place holder while you image is been downloaded
	///   - completionHandler: return a DownloadImageCompleteHandler type (Result<UIImage, NetworkError>)
	func downloadImage(urlSession: URLSessionProtocol = URLSession(configuration: URLSessionConfiguration.default),
					   urlString: String,
					   placeHolder: UIImage? = nil,
					   completionHandler: DownloadImageCompleteHandler?)  {
		
		// converts string to url
		guard let url = URL(string: urlString) else {
			// bad url
			completionHandler?(.failure(NetworkError.badURL))
			return
		}
		
		// establishing the place holder image to the imageview
		image = placeHolder ?? nil
		
		// try to load teh image from cache
		if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
			// image found
			animateTransition(to: imageFromCache)
			completionHandler?(.success(imageFromCache))
		}
		
		// image not found, downlaod it.
		urlSession.dataTask(with: URLRequest(url: url)) { [weak self] (data, response, error) in
			
			if let error = error {
				completionHandler?(.failure(.apiError(error: error)))
			} else if let data = data {
				DispatchQueue.main.async {
					
					// save image to cache
					if let imageToCache = UIImage(data: data) {
						imageCache.setObject(imageToCache, forKey: urlString as NSString)
						
						// display image
						self?.animateTransition(to: imageToCache)
						completionHandler?(.success(imageToCache))
					}
				}
			} else {
				// no data
				completionHandler?(.failure(NetworkError.emptyData))
			}
		}.resume() // start task
	}
}
