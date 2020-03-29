//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-03-29.
//

import Foundation

// MARK: ChessPiece
public enum ChessPiece: String, Hashable, ForsythEdwardsNotationConvertible, CustomStringConvertible {
    case pawn = "p"
    case knight = "n"
    case bishop = "b"
    case rook = "r"
    case queen = "q"
    case king = "k"
}

public extension ChessPiece {
    func fen() -> String {
       rawValue
    }
}
