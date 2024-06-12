//
//  CertificateViewModel.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import SwiftData

@Model
class CertificateViewModel {
    
    let status: String
    let id: String
    let originator: String
    let owner: String
    var isFavourite = false
    
    init(certificate: Certificate) {
        status = certificate.status
        id = certificate.id
        originator = certificate.originator + "/" + certificate.originatorCountry
        owner = certificate.owner + "/" + certificate.ownerCountry
    }
}
