//
//  BackgroundView.swift
//  Wildberries
//
//  Created by Vladimir Murashka on 30.06.2024.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("backgroundDalle")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 80, opaque: true)
    }
}

#Preview {
    BackgroundView()
}

