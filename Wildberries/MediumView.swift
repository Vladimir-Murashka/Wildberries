//
//  MediumView.swift
//  Wildberries
//
//  Created by Vladimir Murashka on 30.06.2024.
//

import SwiftUI

struct MediumView<Content>: View where Content: View {
    
    private let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.mediumColor1, Color.mediumColor2],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            self.content()
        }
        .clipShape(.rect(cornerRadius: 28))
    }
}
