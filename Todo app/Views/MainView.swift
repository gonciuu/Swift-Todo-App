
//  MainView.swift
//  Todo app
//
//  Created by Kacper Wojak on 19/10/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TodoListView()
        }
        else { LoginView() }
    }
}

#Preview {
    MainView()
}
