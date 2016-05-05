//
//  Extensions.swift
//  SwiftOCR
//
//  Created by Nicolas Camenisch on 21.04.16.
//  Copyright © 2016 Nicolas Camenisch. All rights reserved.
//

import Foundation

internal extension Array where Element: Equatable {
    
    func uniq() -> [Element] {
        var arrayCopy = self
        arrayCopy.uniqInPlace()
        return arrayCopy
    }
    
    mutating func uniqInPlace() {
        var seen = [Element]()
        var index = 0
        for element in self {
            if seen.contains(element) {
                removeAtIndex(index)
            } else {
                seen.append(element)
                index += 1
            }
        }
    }
}

public extension FFNN {
    public func copy() -> FFNN {
        return FFNN.init(inputs: self.numInputs, hidden: self.numHidden, outputs: self.numOutputs, learningRate: self.learningRate, momentum: self.momentumFactor, weights: self.getWeights(), activationFunction: self.activationFunction, errorFunction: self.errorFunction)
    }
}