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
    
    var grid2 = [[Percolation.Site]]()
    
    mutating func start() {
        print("start simulation")
        // This defines a mock grid
        
        grid2 = [[Percolation.Site]](repeating: [Percolation.Site](repeating: Percolation.Site(isClosed: false,isFull: false,isOpen: false, id: 100), count: n), count: n)
        var percolation = Percolation(n: n)
        
        var debugCounter = 0
        while (!percolation.percolates()) {
            // Note: Can put short delay here
            let iRandom = StdRandom.uniform(1, b: n+1)
            let jRandom = StdRandom.uniform(1, b: n+1)
            
            percolation.open(iRandom, j: jRandom)
            // print("debug \(debugCounter) ")
            debugCounter += 1
            if (debugCounter > 60) {
                break
            }
        }
        let threshold = Double(percolation.numberOfOpenSites())/Double(n*n)
        print(" threshold = \(threshold)")
    }
    
    mutating func setGridSize(n: Int) {
        print("Set Grid Size \(n) ")
        self.n = n
    }
}
