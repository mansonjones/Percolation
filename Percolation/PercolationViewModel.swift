//
//  PercolationViewModel.swift
//  PercolationTests
//
//  Created by Manson Jones on 10/22/20.
//
//  This is the ViewModel

import Foundation


class PercolationViewModel {
    
    // This is a reference to the model
    // It might be better to call this simulation
    private var simulation = Simulation()
    
    // MARK: - Access to the Model
    // add a function to return the 2d grid.
    // The view model should return a 2d array with cells that are black, blue and whtie
    // This is a good example of how the view model gets the model data ready for presentation
    // in the view that is easily consumable by the view
    //
    
    // MARK: - Intents
    func setGridSize(n: Int) {
        simulation.setGridSize(n: 10)
    }
    
    func startSimulation() {
        simulation.start()
    }
    
    // TODO: Have this return the grid from the simulation
    var grid: [Percolation.Site] {
        var grid = [Percolation.Site]()
        grid.append(Percolation.Site(isClosed: true, isFull: false, isOpen: false, id: 0))
        grid.append(Percolation.Site(isClosed: false, isFull: true, isOpen: false, id: 1))
        grid.append(Percolation.Site(isClosed: false, isFull: false, isOpen: true, id: 2))
        return grid
    }
}
