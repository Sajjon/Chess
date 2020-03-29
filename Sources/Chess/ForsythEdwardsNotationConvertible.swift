//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-03-29.
//

import Foundation

public protocol ForsythEdwardsNotationConvertible {
    func fen() -> String
}

public extension ForsythEdwardsNotationConvertible where Self: CustomStringConvertible {
    var description: String { fen() }
}
