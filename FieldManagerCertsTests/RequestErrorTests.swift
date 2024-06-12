//
//  RequestErrorTests.swift
//  FieldManagerCertsTests
//
//  Created by Phil Martin on 12/06/2024.
//

import XCTest
@testable import FieldManagerCerts

final class RequestErrorTests: XCTestCase {

    func test_requestErrorDecode_isEqual() {
        let sut = RequestError.decode
        XCTAssertEqual(sut.customMessage, "Decode error")
    }
    
    func test_requestErrorUnauthorised_isEqual() {
        let sut = RequestError.unauthorised
        XCTAssertEqual(sut.customMessage, "Unauthorised")
    }
    
    func test_requestErrorUnexpectedStatusCode_isEqual() {
        let sut = RequestError.unexpectedStatusCode
        XCTAssertEqual(sut.customMessage, "Something went wrong")
    }

}
