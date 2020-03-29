//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-03-29.
//

import Foundation

public enum Player: String, Hashable {
    case white, black
}

public extension Player {
    var isWhite: Bool { self == .white }
    
    var startingRankForPawns: Square.Rank {
        isWhite ? 1 : 8
    }
    
    var startingRankForNonPawnPieces: Square.Rank {
        isWhite ? 2 : 7
    }
}
