//
//  PercolationView.swift
//  Percolation
//
//  Created by Manson Jones on 10/22/20.
//

import SwiftUI

struct PercolationView: View {
    
    // Because the ViewModel is a
    // class, the next line creates
    // a pointer to the PercolationViewModel
    var viewModel: PercolationViewModel
    
    var body: some View {
        VStack {
            HStack {
                ForEach(viewModel.grid) { site in
                    SiteView(site: site)
            // let site1 = Percolation.Site(isClosed: false, isFull: true, isOpen: true, id: 0)
            // SiteView(site: site1)
            }
            }
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
}

struct SiteView: View {
    var site: Percolation.Site
    
    var body: some View {
        ZStack { if site.isFull {
                Rectangle().fill(Color.blue)
            } else if site.isOpen {
                Rectangle().fill(Color.green)
            } else {
                Rectangle().fill(Color.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PercolationView(viewModel: PercolationViewModel())
    }
}
