//
//  WeightedQuickUnionUF.swift
//  Percolation
//
//  Created by Manson Jones on 10/22/20.
//

// Based on the Algorithm described by Sedgewick
// https://algs4.cs.princeton.edu/home/

import Foundation

class WeightedQuickUnionUF {
    fileprivate var parent = [Int]()   // parent[i] = parent of i
    fileprivate var size = [Int]()      // size[i] = number of elements in subtree rooted at i
    fileprivate var count: Int          // number of components
    
    init(n: Int) {
        count = n
        parent.reserveCapacity(n)
        size.reserveCapacity(n)
        for i in stride(from: 0, to: n, by:1) {
            parent.append(i)
            size.append(i)
        }
    }
    
    func find(_ p: Int) -> Int {
        validate(p)
        var pTemp = p
        while (pTemp != parent[pTemp]) {
            pTemp = parent[pTemp]
        }
        return pTemp
    }
    
    fileprivate func validate(_ p: Int) {
        let n = parent.count
        // TODO: Throw an exception
        if (p < 0 || p >= n) {
            print("index \(p) is not between 0 and \(n)")
        }
    }
    
    func union(_ p: Int, q: Int) {
        let rootP = find(p)
        let rootQ = find(q)
        if (rootP == rootQ) {
            return
        }
        
        if (size[rootP] < size[rootQ]) {
            parent[rootP] = rootQ
            size[rootQ] += size[rootP]
        }
        else {
            parent[rootQ] = rootP
            size[rootP] += size[rootQ]
        }
        count -= 1
    }
    
}
