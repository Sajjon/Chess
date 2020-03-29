//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-03-29.
//

import Foundation

public struct Board: Hashable, ForsythEdwardsNotationConvertible {
    public typealias Pieces = Set<Piece>
    
    private let squares = Square.allCases
    
    public private(set) var whitePieces: Pieces
    public private(set) var blackPieces: Pieces
    
    public init() {
        
        func nonPawns(player: Player) -> [Piece] {
            func placePieceAt(file: Square.File, piece: ChessPiece) -> Piece {
                Piece(
                    type: piece,
                    square: .init(file: file, rank: player.startingRankForNonPawnPieces),
                    player: player
                )
            }
            let rnb: [ChessPiece] = [.rook, .knight, .bishop]
            let pieces = rnb + [.queen, .king] + rnb.reversed()
            
            return pieces.enumerated().map {
                placePieceAt(
                    file: .init(integerLiteral: UInt8($0.offset) + 1),
                    piece: $0.element
                )
            }
        }
        
        func startingPositions(player: Player) -> [Piece] {
            Square.filesOf(rank: player.startingRankForPawns).map {
                Piece(type: .pawn, square: $0, player: player)
                }
                
                +
                
                nonPawns(player: player)
        }
        
        self.whitePieces = Set(startingPositions(player: .white))
        self.blackPieces = Set(startingPositions(player: .black))
    }
}


public extension Board {
    struct Piece: Hashable, ForsythEdwardsNotationConvertible {
        public let type: ChessPiece
        public let square: Square
        public let player: Player
    }
}



public extension Board.Piece {
    var character: String {
        let fen = type.fen()
        return player.isWhite ? fen.uppercased() : fen
    }
    
    func fen() -> String {
        character
    }
}

public extension Board {
    
    /// An ASCII art representation of `self`.
    ///
    /// The ASCII representation for the starting board:
    ///
    /// ```
    ///   +-----------------+
    /// 8 | r n b q k b n r |
    /// 7 | p p p p p p p p |
    /// 6 | . . . . . . . . |
    /// 5 | . . . . . . . . |
    /// 4 | . . . . . . . . |
    /// 3 | . . . . . . . . |
    /// 2 | P P P P P P P P |
    /// 1 | R N B Q K B N R |
    ///   +-----------------+
    ///     a b c d e f g h
    /// ```
    func ascii() -> String {
        let edge = "  +-----------------+\n"
        var result = edge
        let reversed = Square.Rank.allCases.reversed()
    
        for rank in reversed {

            let strings = Square.File.allCases.map {
                piece(atFile: $0, rank: rank)?.character ?? "."
            }
            
            let str = strings.joined(separator: " ")
            result += "\(rank) | \(str) |\n"
        }
        result += "\(edge)    a b c d e f g h  "
        return result
    }
    
    /// Returns the FEN string for the board.
    ///
    /// - seealso: [FEN (Wikipedia)](https://en.wikipedia.org/wiki/Forsyth%E2%80%93Edwards_Notation),
    ///            [FEN (Chess Programming Wiki)](https://chessprogramming.wikispaces.com/Forsyth-Edwards+Notation)
    func fen() -> String {
        func fen(rank: Square.Rank) -> String {
            var fen = ""
            var accumulator = 0
            for square in Square.filesOf(rank: rank) {
                if let piece = piece(at: square) {
                    if accumulator > 0 {
                        fen += String(accumulator)
                        accumulator = 0
                    }
                    fen += piece.character
                } else {
                    accumulator += 1
                    if square.file == .h {
                        fen += String(accumulator)
                    }
                }
            }
            return fen
        }
        return Square.Rank.allCases.reversed().map(fen).joined(separator: "/")
    }
    
    func piece(at square: Square) -> Piece? {
        func inSet(_ set: Set<Piece>) -> Piece? {
            set.first(where: { $0.square == square })
        }
        
        return (inSet(whitePieces) ?? inSet(blackPieces)) ?? nil
    }
    
    func piece(atFile file: Square.File, rank: Square.Rank) -> Piece? {
        piece(at: .init(file: file, rank: rank))
    }
}
