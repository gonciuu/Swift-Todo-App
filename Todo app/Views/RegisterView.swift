//
//  RegisterView.swift
//  Todo app
//
//  Created by Kacper Wojak on 19/10/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subtitle: "Start using todo list", angle: -10, background: .pink
            )

            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundStyle(.red)
                }
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                TLButton(title: "Register", background: .blue) {
                    viewModel.register()
                }
            }.scrollContentBackground(.hidden).frame(height: 250)
                .offset(y: -50)

            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
