//
//  OnFirstAppearModifier.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import SwiftUI

/// This Modifier is used to only make execute stuff on loading the UI for the first time
struct OnFirstAppearModifier: ViewModifier {
    private let onFirstAppearAction: () -> ()
    @State private var hasAppeared = false
    
    public init(_ onFirstAppearAction: @escaping () -> ()) {
        self.onFirstAppearAction = onFirstAppearAction
    }
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                guard !hasAppeared else { return }
                hasAppeared = true
                onFirstAppearAction()
            }
    }
}
