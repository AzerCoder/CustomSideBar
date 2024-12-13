//
//  Home.swift
//  CustomSideBar
//
//  Created by A'zamjon Abdumuxtorov on 13/12/24.
//

import SwiftUI

struct Home: View {
    @Binding var showMenu: Bool
    var body: some View {
        Button {
            withAnimation {
                showMenu = true
            }
        } label: {
            Text("Show Menu")
        }

    }
}

#Preview {
    ContentView()
}
