//
//  ContentView.swift
//  Percolation
//
//  Created by Manson Jones on 10/22/20.
//

import SwiftUI

struct ContentView: View {
    
    // Because the ViewModel is a
    // class, the next line creates
    // a pointer to the PercolationViewModel
    var viewModel: PercolationViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                print("Start Button was Tapped")
                viewModel.startSimulation()
            }, label: {
                Text("Start Simulation")
            })
            
        }
        HStack {
            Button(action: {
                print("grid size")
                viewModel.startSimulation()
            }, label: {
                Text("Enter Grid Size")
            })
            
        }
        Text("Percolation Value")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PercolationViewModel())
    }
}
