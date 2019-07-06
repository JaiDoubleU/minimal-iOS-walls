//
//  UIImageView+Download.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import UIKit
import MySampleAPI
// NSCache this is just for this basic app. in a real app we should have a better approach
let imageCache = NSCache<NSString, UIImage>()

// MARK: - Allows to async download images
extension UIImageView {
	
	typealias DownloadImageCompleteHandler = ( Result<UIImage, NetworkError> ) -> Void
	
	/// download images and save it in a NSCache
	///
	/// - Parameters:
	///   - interactor: HitsInteractorProtocol
	///   - imageIdentifier: imageIdentifier
	///   - placeHolder: this image will be shown as a place holder while you image is been downloaded
	///   - completionHandler: return a DownloadImageCompleteHandler type (Result<UIImage, NetworkError>)
	func downloadImage(interactor: HitsInteractorProtocol,
					   imageIdentifier: String,
					   placeHolder: UIImage? = nil,
					   completionHandler: DownloadImageCompleteHandler?) {
		// establishing the place holder image to the imageview
		image = placeHolder ?? nil
		
		// try to load teh image from cache
		if let imageFromCache = imageCache.object(forKey: imageIdentifier as NSString) {
			// image found
			animateTransition(to: imageFromCache)
			completionHandler?(.success(imageFromCache))
		}
		
		interactor.downloadImage { [weak self] (result) in
			switch result {
			case .success(let image):
				DispatchQueue.main.async {
					imageCache.setObject(image, forKey: imageIdentifier as NSString)
					// display image
					self?.animateTransition(to: image)
					completionHandler?(.success(image))
				}
			case .failure(let error):
				completionHandler?(.failure(.apiError(error: error)))
			}
		}
	}
}
