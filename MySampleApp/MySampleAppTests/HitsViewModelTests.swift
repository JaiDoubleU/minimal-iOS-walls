////
////  HitsViewModelTests.swift
////  MySampleAppTests
////
////  Created by Alex Núñez on 14/06/2019.
////  Copyright © 2019 All rights reserved.
////
//
//import Foundation
//import XCTest
//
//@testable import MySampleAPI
//@testable import MySampleApp
//
//class HitsViewModelTests: XCTestCase {
//
//	var mockPixabayNetworkService: PixabayNetworkService!
//	var hitsIterator: HitsInteractor!
//	var mockJson: Data?
//	var coordinator: MockCoordinator!
//	var hitsViewModel: HitsViewModel!
//
//	override func setUp() {
//		super.setUp()
//
//		// Services
//		mockPixabayNetworkService = MockPixabayNetworkService()
//		hitsIterator = HitsInteractor(mockPixaBayNetworkService)
//		coordinator = MockCoordinator()
//
//		hitsViewModel = HitsViewModel(interactor: hitsIterator, coordinator: coordinator)
//		generateMockResponseModel()
//	}
//
//	private func generateMockResponseModel() {
//		guard let ressourceURL = Bundle(for: type(of: self)).url(forResource: "PixabayHitsResponseModel", withExtension: "json"),
//			let resourceData = try? Data(contentsOf: ressourceURL) else {
//				XCTFail("PixabayHitsResponseModel.json file doesn't exist or it's invalid")
//				return
//		}
//
//		mockJson = resourceData
//	}
//
//	override func tearDown() {
//		super.tearDown()
//		mockPixabayNetworkService = nil
//		hitsIterator = nil
//		mockJson = nil
//		coordinator = nil
//		hitsViewModel = nil
//	}
//
//	func test_numberOfItems_withData_shouldHave3Items() {
//		mockPixabayNetworkService.session.nextData = mockJson
//		hitsViewModel.fetchHits()
//		XCTAssertEqual(hitsViewModel.numberOfItems(), 3, "The hits model doesn't have 3 items")
//	}
//
//	func test_numberOfSections_shouldHave1Section() {
//		XCTAssertEqual(hitsViewModel.numberOfSections(), 1, "The hits model doesn't have 1 sections")
//	}
//
//	func test_numberOfItems_withNoData_shouldNotHaveItems() {
//		hitsViewModel.fetchHits()
//		XCTAssertEqual(hitsViewModel.numberOfItems(), 0, "The hits model doesn't have 0 items")
//	}
//	func test_title_shouldBePixabayHits() {
//		XCTAssertEqual(hitsViewModel.title, "Pixabay Hits", "The title is not Pixabay Hits")
//	}
//}
//
