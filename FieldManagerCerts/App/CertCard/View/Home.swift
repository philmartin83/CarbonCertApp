//
//  Home.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import SwiftUI
import SwiftData

struct Home: View {
    
    @State private var viewModel = HomeViewModel(service: CertificateService())
    @State private var pageNumber: Int = 1
    
    @Query() private var favouriteItems: [CertificateViewModel]
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.state == .loading {
                    VStack(spacing: 8) {
                        ProgressView()
                        Text("Loading")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                } else if viewModel.state == .normal {
                    if viewModel.isViewDataEmpty {
                        ContentUnavailableView("No Results", systemImage: "list.bullet")
                    } else if viewModel.isFavouritesEmpty {
                        ContentUnavailableView("No Favourites", systemImage: "star.fill")
                    } else {
                        List(viewModel.viewData) { cert in
                            CertificateCard(cer: cert)
                                .listRowSeparator(.hidden)
                                .onFirstAppear {
                                    guard let index = viewModel.results.firstIndex(where: {$0.id == cert.id}) else {return}
                                    if viewModel.shouldFetchData(id: index) {
                                        pageNumber += 1
                                        viewModel.fetchListOfCert(pageNumber: pageNumber)
                                    }
                                }
                                .buttonStyle(.plain)
                        }
                      
                    }
                }
            }
            .onChange(of: favouriteItems, { oldValue, newValue in
                viewModel.favouriteItems = newValue
            })
            .onFirstAppear {
                viewModel.favouriteItems = favouriteItems
                viewModel.fetchListOfCert(isFirstLoad: true)
            }
            .listStyle(.plain)
            .navigationTitle("Certificates")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.brandColour,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation {
                            viewModel.isFavourite.toggle()
                        }
                    } label: {
                        Image(systemName: viewModel.isFavourite ? "bookmark.fill" : "bookmark")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    Home()
}
