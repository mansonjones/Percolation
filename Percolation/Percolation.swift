//
//  Percolation.swift
//  PercolationTests
//
//  Created by Manson Jones on 10/22/20.
//
// This class is part of the model.
// Eventually it should become a struct.

import Foundation

// This is the API defined in the homework in Sedgewick's
// Algorithms course on Coursera

class Percolation {
    // creates n-by-n grid, with all sites initially blocked.
    // private var grid = [[Bool]]()
    
    private var grid = [[Bool]]()
    var grid2 = [[Site]]() // Not private, because it will be shared
    private var virtualTopSite: Int
    private var virtualBottomSite: Int
    private var size: Int = 0
    private var uf: WeightedQuickUnionUF
    
    
    init(n: Int) {
        // todo: throw an exception if N is <= 0, creating a failable initializer
        virtualTopSite = 0
        virtualBottomSite = n*n + 1
        size = n
        grid = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        grid2 = [[Site]](repeating: [Site](repeating: Site(isClosed: false,isFull: false,isOpen: false,id: 100), count: n), count: n)
        uf = WeightedQuickUnionUF(n: n*n+2)
        
        for i in 1...n {
            uf.union(virtualTopSite, q: ufIndex(i, j: 1))
            uf.union(virtualBottomSite, q: ufIndex(i, j: size))
        }
        
        
    }
    
    // Site conforms to the identifiable protocol
    struct Site: Identifiable {
        var isClosed: Bool = false
        var isFull: Bool = false
        var isOpen: Bool = false
        var id: Int 
    }
    
    // opens the site (row, col) if it is not open already
    func open(_ i: Int, j: Int) {
        // todo: throw an exception if i or j are outside the prescribed range
        // check(i,j:j)
        grid[i-1][j-1] = true
        // connect to adjacent sites
        // upper left corner - connect to right and below
        let cellIndex = ufIndex(i, j: j)
        if ((i == 1) && (j == 1)) {
            if isOpen(i, j:j+1) { uf.union(cellIndex, q: ufIndex(i, j: j+1)) }
            if isOpen(i+1, j:j) { uf.union(cellIndex, q: ufIndex(i+1, j: j)) }
            return
        }
        // upper right corner - connect to left and below
        if ((i == 1) && (j == size)) {
            if isOpen(i, j:j-1) { uf.union(cellIndex, q: ufIndex(i, j: j-1)) }
            if isOpen(i+1, j:j) { uf.union(cellIndex, q: ufIndex(i+1, j: j)) }
            return
        }
        // lower left corner - connect to right and above
        if ((i == size) && (j == 1)) {
            if isOpen(i, j:j+1) { uf.union(cellIndex, q: ufIndex(i, j: j+1)) }
            if isOpen(i-1, j:j) { uf.union(cellIndex, q: ufIndex(i-1, j: j)) }
            return
        }
        // lower right corner - connect to left and above
        if ((i == size) && (j == size)) {
            if isOpen(i, j:j-1) { uf.union(cellIndex, q: ufIndex(i, j: j-1)) }
            if isOpen(i-1, j:j) { uf.union(cellIndex, q: ufIndex(i-1, j: j)) }
            return
        }
    }
    
    // is the site (row, col) open?
    func isOpen(_ i: Int, j: Int) -> Bool {
        // todo: throw an error if i or j is outside the prescribed range
        check(i, j:j)
        return grid[i-1][j-1]
    }
    
    // is the site (row, col) full?
    func isFull(_ i: Int, j: Int) -> Bool {
        // todo: throw an error if i or j is outside the prescribed range
        check(i,j:j)
        return uf.connected(ufIndex(i, j:j), q: virtualTopSite) && isOpen(i, j: j)
    }
    
    // returns the number of open sites
    func numberOfOpenSites() -> Int {
        var sum = 0
        for i in 0..<size {
            for j in 0..<size {
               // print("(i,j) = \(i) \(j) \(sum)")
                if (grid[i][j] == true) {
                    sum = sum + 1
                    // print(" sum \(sum)")
                }
            }
        }
        return sum
        
    }
    
    // does the system percolate?
    func percolates() -> Bool {
        return uf.connected(virtualBottomSite, q: virtualTopSite)
    }
    
    fileprivate func ufIndex(_ i: Int, j: Int) -> Int {
        check(i,j:j)
        return (i-1)*size + j
    }
    
    // Computed property
    var getGrid: [[Bool]] {
        return grid
    }
    
    fileprivate func check(_ i: Int, j: Int) {
        
    }
    
}
