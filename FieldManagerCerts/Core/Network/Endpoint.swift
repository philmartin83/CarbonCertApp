//
//  Endpoint.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: Data? { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://api-dev-v2.fieldmargin.com/tech-test/certificates"
    }
}

enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}
