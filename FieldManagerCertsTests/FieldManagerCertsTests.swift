//
//  FieldManagerCertsTests.swift
//  FieldManagerCertsTests
//
//  Created by Phil Martin on 12/06/2024.
//

import XCTest
@testable import FieldManagerCerts

final class FieldManagerCertsTests: XCTestCase {
    
    
    var sut: CertificateViewModel!
    
    override func setUpWithError() throws {
        sut = CertificateViewModel(certificate: Certificate.testData)
    }
    
    func test_idHasAValue_isEqual() {
        XCTAssertEqual(sut.id, "1234567")
    }
    
    func test_status_isEqual() {
        XCTAssertEqual(sut.status, "Retired")
    }
    
    func test_owner_isEqual() {
        XCTAssertEqual(sut.owner, "Zachary/FR")
    }
    
    func test_originator_isEqual() {
        XCTAssertEqual(sut.originator, "Verra/GB")
    }
    
}
