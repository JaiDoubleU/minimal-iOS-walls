//
//  PixabayHitsResponseModel.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

// MARK: - PixabayHitsResponseModel
struct PixabayHitsResponseModel: Decodable {
	let totalHits: Int
	let hits: [Hit]
	let total: Int
}

// MARK: - Hit
@objc public class Hit: NSObject, Decodable {
	public let largeImageURL: String
	public let webformatHeight, webformatWidth, likes, imageWidth: Int
	public let id, userID, views, comments: Int
	public let pageURL: String
	public let imageHeight: Int
	public let webformatURL: String
	public let type: String
	public let previewHeight: Int
	public let tags: String
	public let downloads: Int
	public let user: String
	public let favorites, imageSize, previewWidth: Int
	public let userImageURL: String
	public let previewURL: String
	
	enum CodingKeys: String, CodingKey {
		case largeImageURL, webformatHeight, webformatWidth, likes, imageWidth, id
		case userID = "user_id"
		case views, comments, pageURL, imageHeight, webformatURL, type, previewHeight, tags, downloads, user, favorites, imageSize, previewWidth, userImageURL, previewURL
	}
}
