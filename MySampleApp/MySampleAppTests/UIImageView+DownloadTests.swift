//
//  UIImage+DownloadTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 14/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import UIKit
import XCTest

@testable import MySampleApp

class UIImageViewDownloadTests: XCTestCase {
	
	var session: MockURLSession!
	var imageView: UIImageView!
	
	override func setUp() {
		super.setUp()
		
		session = MockURLSession()
		imageView = UIImageView()
	}
	
	override func tearDown() {
		super.tearDown()
		session = nil
		imageView = nil
	}
	
	func test_downloadImage_withEmptyURL_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Should get bad url error")
		
		imageView.downloadImage(urlSession: session, urlString: "") { (result) in
			switch result {
			case .success(let data):
				XCTAssertNotNil(data, "We shouldn't get an data")
			case .failure(let error):
				if error == NetworkError.badURL {
					expectation.fulfill()
				} else {
					XCTFail("The error is different from bad URL")
				}
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_downloadImage_withBadURL_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Should get bad url error")
		
		imageView.downloadImage(urlSession: session, urlString: "((\\w)*|([0-9]") { (result) in
			switch result {
			case .success(let data):
				XCTAssertNotNil(data, "We shouldn't get an data")
			case .failure(let error):
				if error == NetworkError.badURL {
					expectation.fulfill()
				} else {
					XCTFail("The error is different to bad URL")
				}
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_downloadImage_withCorrectURL_shouldReturnData() {
		let expectation = XCTestExpectation(description: "Should return data")
		
		let bundle = Bundle(for: type(of: self))
		guard let expectedIimage = UIImage(named: "imagePlaceholder", in: bundle, compatibleWith: nil), let pngData = expectedIimage.pngData() else {
			XCTFail("the image is not valid")
			return
		}
		
		let expectedData = pngData
		session.nextData = expectedData
		
		imageView.downloadImage(urlSession: session, urlString: "https://cdn.pixabay.com/photo/2019/06/11/12/53/placeholder.jpg") { (result) in
			switch result {
			case .success(let image):
				XCTAssertNotNil(image, "The image shouldn't be nil")
				XCTAssertEqual(expectedData, pngData, "The images aren't the same")
				expectation.fulfill()
			case .failure(let error):
				XCTFail(error.errorDescription ?? "test_downloadImage_withCorrectURL_shouldData should return data")
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_downloadImage_withNoData_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Should return nil data")
		
		session.nextData = nil
		
		imageView.downloadImage(urlSession: session, urlString: "https://nopng") { (result) in
			switch result {
			case .success(let image):
				XCTAssertNil(image, "The image should be nil")
			case .failure(let error):
				if error == NetworkError.emptyData {
					expectation.fulfill()
				} else {
					XCTFail("The error is different from emptyData")
				}
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
}
