//
//  RegisterView.swift
//  Todo app
//
//  Created by Kacper Wojak on 19/10/2024.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subtitle: "Start using todo list", angle: -10, background: .pink
            )

            Form {
                TextField("Full Name", text: $name)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("Password", text: $password)
                TLButton(title: "Register", background: .blue) {}
            }.scrollContentBackground(.hidden).frame(height: 250)
                .offset(y: -50)

            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
