//
//  Simulation.swift
//  Percolation
//
//  Created by Manson Jones on 10/22/20.
//

import Foundation

// This is the main model class

struct Simulation {
    var n: Int = 10
    
    func start() {
        print("start simulation")
        let percolation = Percolation(n: n)
        /*
        if (!percolation.percolates()) {
            // select i and j at random
            
        }
        */
    }
    
    mutating func setGridSize(n: Int) {
        print("Set Grid Size \(n) ")
        self.n = n
    }
}
