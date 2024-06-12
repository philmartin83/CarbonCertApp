//
//  APIConfig.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import Foundation

struct APIConfig {
    
    static var apiKey: String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String
            else { fatalError("not found") }
        return apiKey
    }
}
