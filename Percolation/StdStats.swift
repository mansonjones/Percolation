//
//  StdStats.swift
//  Percolation
//
//  Created by Manson Jones on 10/23/20.
//

import Foundation

class StdStats {
    
    static func mean(_ a: [Double]) -> Double {
        // ToDo: Handle the case where array is 0
        // it might be smart in this case to return an optional
        // if a.count == 0 return
        let summation = sum(a)
        return summation / Double(a.count)
        
    }
    
    static func stddev(_ a: [Double]) -> Double {
        // to do: Handle the case where the array is 0
        // probably want to use an optional
        // if a.count == 0 return nil
        return sqrt(variance(a))
    }
    
    static func variance(_ a: [Double]) -> Double {
        // to do: Handle the case where the array is 0
        // probably want to use an optional
        var avg = mean(a)
        avg = mean(a)
        var sum = 0.0
        for i in stride(from: 0, to: a.count, by: 1) {
            sum += (a[i] - avg) * (a[i] - avg)
        }
        return sum / Double(a.count - 1)
    }
    
    fileprivate static func sum(_ a: [Double]) -> Double {
        var sum = 0.0
        for i in stride(from: 0, to: a.count, by: 1) {
            sum += a[i]
        }
        return sum
    }
}
