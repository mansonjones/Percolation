#
 Percolation

## Architecture and Design
 The Percolate app is implemented using the MVVM Design Pattern.
This design has the following advantages:
The Model classes perform the simulation.
The View classes present the data to the user.  The View classes contain
no state. They only react to changes in the Model.

The ModelView classes bind the Model data to the View, and interpret the
model data when necessary to make it easier to present to the View.


When the model changes, those changes are published.
The View subscribes to the model, so that it notices changes in the model.

The views job is only to react to the model and update itself.

The ViewModel processes the intent of the user (ie, grid size, start the simulation)a

Struct is a value type(stored in stack), Class is a reference type(stored in heap). 

ModelView Classes
* Remember that the ViewModel is always a class, because it needs to be shared among 
different classes. 

=======
Struct is a value type(stored in stack), Class is a reference type(stored in heap).

## Model Structures:
  Percolation
  Simulation
  WeghtedQuickUnionUF

## ViewModel Class
  PercolationViewModel

## View Structures (Implemented using SwiftUI)
 ContentView

