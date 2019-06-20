//
//  UIColor+HexTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 19/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import XCTest
@testable import MySampleApp

class UIColor_HexTests: XCTestCase {
	
	func test_initHex_withValidColor_shouldBeValid() {
		let color = UIColor(hexString: "#363636")
		XCTAssertEqual(color, UIColor(red: 54, green: 54, blue: 54), "The color is different to the color expected")
	}

	func test_initHexColor_withoutHashSymbol_shouldBeValid() {
		let color = UIColor(hexString: "363636")
		XCTAssertEqual(color, UIColor(red: 54, green: 54, blue: 54), "The color is different to the color expected")
	}

	func test_initHexColor_withAllLetters_shouldBeGray() {
		let color = UIColor(hexString: "cccccc")
		XCTAssertEqual(color, UIColor(red: 204, green: 204, blue: 204), "The color is different to the color expected")
	}

	func test_initHexColor_emptyString_shouldBeBlack() {
		let color = UIColor(hexString: "")
		XCTAssertEqual(color, UIColor(red: 0, green: 0, blue: 0), "The color is different to the color expected")
	}

	func test_initHexColor_withLetterssAndDigits_shouldBeBlack() {
		let color = UIColor(hexString: "#ZZZ36")
		XCTAssertEqual(color, UIColor(red: 0, green: 0, blue: 0), "The color is different to the color expected")
	}
}
