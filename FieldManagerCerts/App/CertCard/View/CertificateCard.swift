//
//  CertificateCard.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import SwiftUI

struct CertificateCard: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Bindable var cer: CertificateViewModel
    
    // MARK: -
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing:16) {
                Text("Unique ID")
                    .bold()
                    .font(.title)
                Text(cer.id)
                    .font(.caption)
                Divider()
                
                Text("Originator")
                    .bold()
                    .font(.title3)
                Text(cer.originator)
                    .font(.caption)
                
                Divider()
                Text("Owner")
                    .bold()
                    .font(.title3)
                Text(cer.owner)
                    .font(.caption)
            }
            Button {
                cer.isFavourite.toggle()
                if cer.isFavourite {
                    modelContext.insert(cer)
                } else {
                    modelContext.delete(cer)
                }
                    
            } label: {
                Image(systemName: cer.isFavourite ? "bookmark.fill" : "bookmark")
                    .foregroundStyle(.brandColour)
            }

        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .background(Color.brandColour.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CertificateCard(cer: CertificateViewModel(certificate: Certificate.testData))
}
