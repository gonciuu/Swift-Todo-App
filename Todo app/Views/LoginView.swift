//
//  LoginView.swift
//  Todo app
//
//  Created by Kacper Wojak on 19/10/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "To do list", subtitle: "Get things done", angle: 10, background: .pink
                )

                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundStyle(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                    TLButton(title: "Sign in", background: .blue) {
                        viewModel.login()
                    }
                }.scrollContentBackground(.hidden).frame(height: 250)
                    .offset(y: -50)

                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())

                }.padding(.bottom, 50)

                Spacer()
            }.padding()
        }
    }
}

#Preview {
    LoginView()
}
