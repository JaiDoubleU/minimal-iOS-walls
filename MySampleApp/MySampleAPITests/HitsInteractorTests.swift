//
//  HitsIteractorTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 14/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
import XCTest

@testable import MySampleAPI

class HitsInteractorTests: XCTestCase {
	
	var mockJson: Data?
	var defaultNetworkModel: NetworkModel!
	
	override func setUp() {
		super.setUp()
		
		// model
		defaultNetworkModel = NetworkModel(base: PixabayNetworkServiceUrls.apiBase,
										   path: PixabayNetworkServiceUrls.apiPath,
										   method: .get)
		// Mock JSON file
		generateMockResponseModel()
	}
	
	private func generateMockResponseModel() {
		guard let ressourceURL = Bundle(for: type(of: self)).url(forResource: "PixabayHitsResponseModel", withExtension: "json"),
			let resourceData = try? Data(contentsOf: ressourceURL) else {
				XCTFail("PixabayHitsResponseModel.json file doesn't exist or it's invalid")
				return
		}
		
		mockJson = resourceData
	}
		
	override func tearDown() {
		super.tearDown()
		mockJson = nil
		defaultNetworkModel = nil
	}
	
	func test_fetchHits_withData_shouldNotBeEmpty() {
		let expectation = XCTestExpectation(description: "Shouldn't be empty")
		
		let session = MockURLSession()
		session.nextData = mockJson
		
		let service = MockPixabayNetworkService(session: session, networkModel: defaultNetworkModel)
		let hitsInteractor = HitsInteractor(service)
		hitsInteractor.fetchHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertNotNil(data, "The data is empty")
			case .failure(_):
				XCTFail("It shouldn't return an error")
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_fetchHits_withData_shouldHave3Items() {
		let expectation = XCTestExpectation(description: "Should return 3 items")
		
		let session = MockURLSession()
		session.nextData = mockJson
		
		let service = MockPixabayNetworkService(session: session, networkModel: defaultNetworkModel)
		let hitsInteractor = HitsInteractor(service)
		hitsInteractor.fetchHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertEqual(data.count, 3, "The return item is diferent than 3")
			case .failure(_):
				XCTFail("It shouldn't return an error")
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_fetchHits_withNoData() {
		let expectation = XCTestExpectation(description: "Shouldn't return data")
		
		let service = MockPixabayNetworkService(session: MockURLSession(), networkModel: defaultNetworkModel)
		let hitsInteractor = HitsInteractor(service)
		hitsInteractor.fetchHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertNil(data, "Data should be nil")
			case .failure(let error):
				if error == NetworkError.emptyData {
				} else {
					XCTFail("fetchHits is returning a different error than empty data")
				}
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_downloadImage_withEmptyURL_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Should get bad url error")
		
		let service = MockPixabayNetworkService(networkModel: NetworkModel(base: "", method: .get))
		let hitsInteractor = HitsInteractor(service)
		hitsInteractor.downloadImage { (result) in
			switch result {
			case .success(let image):
				XCTAssertNotNil(image, "We shouldn't get an image")
			case .failure(let error):
				if error != NetworkError.badURL {
					XCTFail("The error is different from bad URL")
				}
			}
			
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_downloadImage_withBadURL_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Should get bad url error")
		
		let service = MockPixabayNetworkService(networkModel: NetworkModel(base: "((\\w)*|([0-9]", method: .get))
		let hitsInteractor = HitsInteractor(service)
		hitsInteractor.downloadImage { (result) in
			switch result {
			case .success(let image):
				XCTAssertNotNil(image, "We shouldn't get an image")
			case .failure(let error):
				if error != NetworkError.badURL {
					XCTFail("The error is different to bad URL")
				}
			}
			
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_downloadImage_withCorrectURL_shouldReturnData() {
		let expectation = XCTestExpectation(description: "Should return data")
		
		let bundle = Bundle(for: type(of: self))
		guard let expectedIimage = UIImage(named: "MockImage", in: bundle, compatibleWith: nil), let pngData = expectedIimage.pngData() else {
			XCTFail("the image is not valid")
			return
		}
		
		let session = MockURLSession()
		let expectedData = pngData
		session.nextData = expectedData
		
		let service = MockPixabayNetworkService(session: session, networkModel: NetworkModel(base: "https://cdn.pixabay.com/photo/2019/06/11/12/53/placeholder.jpg", method: .get))
		
		let hitsInteractor = HitsInteractor(service)
		hitsInteractor.downloadImage { (result) in
			switch result {
			case .success(let image):
				XCTAssertNotNil(image, "The image shouldn't be nil")
				XCTAssertEqual(expectedData, pngData, "The images aren't the same")
			case .failure(let error):
				XCTFail(error.errorDescription ?? "test_downloadImage_withCorrectURL_shouldData should return data")
			}
			
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_downloadImage_withNoData_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Should return nil data")
		
		let service = MockPixabayNetworkService(networkModel: NetworkModel(base: "https://nopng", method: .get))
		let hitsInteractor = HitsInteractor(service)
		hitsInteractor.downloadImage { (result) in
			switch result {
			case .success(let image):
				XCTAssertNil(image, "The image should be nil")
			case .failure(let error):
				if error != NetworkError.emptyData {
					XCTFail("The error is different from emptyData")
				}
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
}
