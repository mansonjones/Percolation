//
//  Percolation.swift
//  PercolationTests
//
//  Created by Manson Jones on 10/22/20.
//
// This class is part of the model.
// Eventually it should become a struct.

import Foundation

struct Percolation {
    // creates n-by-n grid, with all sites initially blocked.
    // private var grid = [[Bool]]()
    
    var grid = [Bool]()
    
    init(n: Int) {
        for _ in 0..<n {
            grid.append(false)
        }
    }
    
    // opens the site (row, col) if it is not open alreadh
    func open(_ i: Int, j: Int) {
        
    }
    
    // is the site (row, col) open?
    func isOpen(_ i: Int, j: Int) -> Bool {
        return true
    }
    
    // is the site (row, col) full?
    func isFull(_ i: Int, j: Int) -> Bool {
        return true
        
    }
    
    // returns the number of open sites
    func numberOfOpenSites() -> Int {
        return 10
    }
    
    // does the system percolate?
    func percolates() -> Bool {
        return true
    }
}
