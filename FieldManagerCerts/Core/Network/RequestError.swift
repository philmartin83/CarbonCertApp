//
//  RequestError.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorised
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorised:
            return "Unauthorised"
        case .unexpectedStatusCode:
            return "Something went wrong"
        default:
            return "Unknown error"
        }
    }
}
