//
//  PercolationApp.swift
//  Percolation
//
//  Created by Manson Jones on 10/22/20.
//

import SwiftUI

@main
struct PercolationApp: App {
    var body: some Scene {
        WindowGroup {
            let percolationViewModel = PercolationViewModel()
            ContentView(viewModel: percolationViewModel)
        }
    }
}

struct PercolationApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
