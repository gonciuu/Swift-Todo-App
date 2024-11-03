//
//  SwiftUIView.swift
//  Todo app
//
//  Created by Kacper Wojak on 20/10/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color

    var body: some View {
        ZStack {
            Rectangle()
                .fill(background).rotationEffect(Angle(degrees: angle))

            VStack {
                Text(title)
                    .font(.system(size: 48)).foregroundColor(.white).bold()

                Text(subtitle).font(.system(size: 24)).foregroundColor(.white)
            }.padding(.top, 48)
        }.frame(width: UIScreen.main.bounds.width * 2, height: 350).offset(y: -150)
    }
}

#Preview {
    HeaderView(
        title: "To do list", subtitle: "Get things done", angle: 15, background: Color.primary
    )
}
