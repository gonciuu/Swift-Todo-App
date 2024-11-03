//
//  TLButton.swift
//  Todo app
//
//  Created by Kacper Wojak on 21/10/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity).padding(4)
        }.buttonStyle(.borderedProminent)
    }
}

#Preview {
    TLButton(title: "Sample title", background: .blue) {}
}
