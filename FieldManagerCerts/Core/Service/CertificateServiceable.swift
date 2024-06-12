//
//  CertificateServiceable.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import Foundation


class CertificateService: HTTPClient, CertificateServiceable {
    
    /**
     - Parameters:
     -  offset: the offset of the page required for the cert
     */
    
    func fetchListOfCert(offset: Int) async throws -> [Certificate] {
        try await sendRequest(endpoint: CertificateEndpoint.certificateList(offset: offset), responseModel: [Certificate].self)
    }
    
}
