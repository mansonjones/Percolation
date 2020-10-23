//
//  StdRandom.swift
//  Percolation
//
//  Created by Manson Jones on 10/23/20.
//

import Foundation

class StdRandom {
    
    static func uniform(_ a: Int) -> Int {
        //
        let random = Int(arc4random_uniform(UInt32(a)))
        return random
    }
    
    // Returns a random integer uniformly in [a, b).
    //
    static func uniform(_ a: Int, b: Int) -> Int {
        // to do: throw exception when inputs are invalid
        return a + uniform(b - a)
    }
    
}
