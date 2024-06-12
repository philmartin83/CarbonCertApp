//
//  View+Extension.swift
//  FieldManagerCerts
//
//  Created by Phil Martin on 12/06/2024.
//

import SwiftUI

extension View {
    func onFirstAppear(_ onFirstAppearAction: @escaping () -> () ) -> some View {
        modifier(OnFirstAppearModifier(onFirstAppearAction))
    }
}
