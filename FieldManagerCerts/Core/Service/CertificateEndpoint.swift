//
//  CertificateEndpoint.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import Foundation

protocol CertificateServiceable {
    func fetchListOfCert(offset: Int) async throws -> [Certificate]
}

enum CertificateEndpoint {
    case certificateList(offset: Int)
}

extension CertificateEndpoint: Endpoint {
    var method: RequestMethod {
        switch self {
        case .certificateList:
                .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .certificateList:
            ["API-KEY": APIConfig.apiKey]
        }
    }
    
    var body: Data? {
        switch self {
        case .certificateList:
            nil
        }
    }
    
    var path: String {
        switch self {
        case .certificateList(let offset):
            return "?limit=5&page=\(offset)"
        }
    }
}
