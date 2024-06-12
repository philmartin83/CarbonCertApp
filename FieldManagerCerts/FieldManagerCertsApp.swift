//
//  FieldManagerCertsApp.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import SwiftUI
import SwiftData

@main
struct FieldManagerCertsApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
                .modelContainer(for:[CertificateViewModel.self])
        }
    }
}
