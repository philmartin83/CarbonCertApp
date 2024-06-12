//
//  Certificate.swift
//  Downtime
//
//  Created by Phil Martin on 12/06/2024.
//

import Foundation

struct Certificate: Codable {
    let status: String
    let id: String
    let owner: String
    let originatorCountry: String
    let originator: String
    let ownerCountry: String
    
    enum CodingKeys: String, CodingKey {
        case status, id, owner
        case originatorCountry = "originator-country"
        case originator
        case ownerCountry = "owner-country"
    }
    
    static var testData: Certificate {
        Certificate(status: "Retired", id: "1234567", owner: "Zachary", originatorCountry: "GB", originator: "Verra", ownerCountry: "FR")
    }
}
