//
//  HomeViewModel.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import Foundation

@Observable class HomeViewModel {
    
    enum ViewState {
        case loading
        case newPageLoading
        case normal
    }
    
    // MARK: - Private Properties
    private let service: CertificateService!
    
    // MARK: - Observable Properties
    var results: [CertificateViewModel] = []
    var favouriteItems: [CertificateViewModel] = []
    var isFavourite = false
    var hasMoreData = false
    
    var state: ViewState = .normal
    
    // MARK: - Computed Properties
    var viewData: [CertificateViewModel] {
        isFavourite ? favouriteItems : results
    }
    
    var isViewDataEmpty: Bool {
        results.isEmpty
    }
    
    var isFavouritesEmpty: Bool {
        favouriteItems.isEmpty && isFavourite
    }
    
    // MARK: - Initaliser
    init(service: CertificateService!) {
        self.service = service
    }
    
    func fetchListOfCert(pageNumber: Int = 1, isFirstLoad: Bool = false) {
        if isFirstLoad {
            state = .loading
        }
        Task {
            do {
                let items = try await service.fetchListOfCert(offset: pageNumber)
                results.append(contentsOf: items.map({CertificateViewModel(certificate: $0)})) 
                checkForExisitingFavourites()
                hasMoreData = items.count > 0
                if isFirstLoad {
                    state = .normal
                }
            } catch {
                
                print(error.localizedDescription)
            }
           
        }
    }
    
    func shouldFetchData(id: Int) -> Bool {
        return id == results.count-2 && hasMoreData
    }
    
    
    private func checkForExisitingFavourites() {
        results.forEach { cert in
            if favouriteItems.first(where: {$0.id == cert.id}) != nil {
                cert.isFavourite = true
            }
        }
    }
    
}
