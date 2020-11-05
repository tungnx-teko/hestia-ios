//
//  RNResponseUtilsTests.swift
//  HestiaReactNativeTests
//
//  Created by batu on 11/5/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import XCTest
@testable import HestiaReactNative

class RNResponseUtilsTests: XCTestCase {

    func testconvertDataToTransfer_PrimitiveType() throws {
        XCTAssertEqual(1, RNResponseUtils.convertDataToTransfer(1) as! Int)
        XCTAssertEqual("string", RNResponseUtils.convertDataToTransfer("string") as! String)
        XCTAssertEqual(true, RNResponseUtils.convertDataToTransfer(true) as! Bool)
    }
    
    func testconvertDataToTransfer_ArrayOfPrimitiveType() throws {
        XCTAssertEqual([1, 2, 3], RNResponseUtils.convertDataToTransfer([1, 2, 3]) as! Array<Int>)
        XCTAssertEqual(["string1", "string2", "string3"], RNResponseUtils.convertDataToTransfer(["string1", "string2", "string3"]) as! Array<String>)
        XCTAssertEqual([true, false, true], RNResponseUtils.convertDataToTransfer([true, false, true]) as! Array<Bool>)
    }

    func testconvertDataToTransfer_Manifest() throws {
        let manifestInput = Manifest(
            version: "0.1.2",
            data: ManifestData(
                assets: [Asset(url: "url-asset-1", name: "asset-1"), Asset(url: "url-asset-2", name: "asset-2")]
            )
        )
        let convertedResult = RNResponseUtils.convertDataToTransfer(manifestInput) as! [String: Any]
        let expectedResult: [String: Any] = [
            "version": "0.1.2",
            "data": [
                "type": "manifest-data",
                "assets": [
                    ["url": "url-asset-1", "name": "asset-1"],
                    ["url": "url-asset-2", "name": "asset-2"]
                ]
            ]
        ]
        XCTAssert(EquationUtils.equalDictionary(expectedResult, convertedResult))
    }
    
    func testconvertDataToTransfer_ListManifest() throws {
        let manifestInput = Manifest(
            version: "0.1.2",
            data: ManifestData(
                assets: [Asset(url: "url-asset-1", name: "asset-1"), Asset(url: "url-asset-2", name: "asset-2")]
            )
        )
        let convertedResult = RNResponseUtils.convertDataToTransfer([manifestInput]) as! [Any]
        let expectedResult: [Any] = [[
            "version": "0.1.2",
            "data": [
                "type": "manifest-data",
                "assets": [
                    ["url": "url-asset-1", "name": "asset-1"],
                    ["url": "url-asset-2", "name": "asset-2"]
                ]
            ]
        ]]
        XCTAssert(EquationUtils.arrayEqual(expectedResult, convertedResult))
    }
}
