
/// A square on a chess board
public struct Square: Hashable, CaseIterable {
    public let file: File
    public let rank: Rank
}

public extension Square {
    /// Vertical column, `a`, ..., ` h`, where `a` is the leftmost column, and `h` is the rightmost column.
    enum File: UInt8, CaseIterable, ExpressibleByIntegerLiteral {
        case a = 1, b, c, d, e, f, g, h
    }
}

public extension Square.File {
    init(integerLiteral value: UInt8) {
        guard let file = Self(rawValue: value) else {
            fatalError("Bad literal: \(value)")
        }
        self = file
    }
}

public extension Square {
    /// Horizontal row, `1-8` (.one, ..., .eight), where `8` is the topmost row, and `1` is the bottenmost row
    enum Rank: UInt8, CaseIterable, ExpressibleByIntegerLiteral, CustomStringConvertible {
        case one = 1, two, three, four, five, six, seven, eight
    }
}

public extension Square.Rank {
    init(integerLiteral value: UInt8) {
        guard let rank = Self(rawValue: value) else {
            fatalError("Bad literal: \(value)")
        }
        self = rank
    }
    
    var description: String { rawValue.description }
}

// MARK: CaseIterable
public extension Square {
    
    typealias AllCases = [Self]
    static let allCases = Square.all
    
    static var all: [Self] {
        [
            filesOf(rank: 8),
            filesOf(rank: 7),
            filesOf(rank: 6),
            filesOf(rank: 5),
            filesOf(rank: 4),
            filesOf(rank: 3),
            filesOf(rank: 2),
            filesOf(rank: 1)
        ].flatMap { $0 }
    }
    
    static func filesOf(rank: Rank) -> [Self] {
        File.allCases.map { Self(file: $0, rank: rank) }
    }
            
    // MARK: file `a`
    static let a1 = Self(file: .a, rank: .one)
    static let a2 = Self(file: .a, rank: .two)
    static let a3 = Self(file: .a, rank: .three)
    static let a4 = Self(file: .a, rank: .four)
    static let a5 = Self(file: .a, rank: .five)
    static let a6 = Self(file: .a, rank: .six)
    static let a7 = Self(file: .a, rank: .seven)
    static let a8 = Self(file: .a, rank: .eight)

    // MARK: file `b`
    static let b1 = Self(file: .b, rank: .one)
    static let b2 = Self(file: .b, rank: .two)
    static let b3 = Self(file: .b, rank: .three)
    static let b4 = Self(file: .b, rank: .four)
    static let b5 = Self(file: .b, rank: .five)
    static let b6 = Self(file: .b, rank: .six)
    static let b7 = Self(file: .b, rank: .seven)
    static let b8 = Self(file: .b, rank: .eight)

    // MARK: file `c`
    static let c1 = Self(file: .c, rank: .one)
    static let c2 = Self(file: .c, rank: .two)
    static let c3 = Self(file: .c, rank: .three)
    static let c4 = Self(file: .c, rank: .four)
    static let c5 = Self(file: .c, rank: .five)
    static let c6 = Self(file: .c, rank: .six)
    static let c7 = Self(file: .c, rank: .seven)
    static let c8 = Self(file: .c, rank: .eight)

    // MARK: file `d`
    static let d1 = Self(file: .d, rank: .one)
    static let d2 = Self(file: .d, rank: .two)
    static let d3 = Self(file: .d, rank: .three)
    static let d4 = Self(file: .d, rank: .four)
    static let d5 = Self(file: .d, rank: .five)
    static let d6 = Self(file: .d, rank: .six)
    static let d7 = Self(file: .d, rank: .seven)
    static let d8 = Self(file: .d, rank: .eight)

    // MARK: file `e`
    static let e1 = Self(file: .e, rank: .one)
    static let e2 = Self(file: .e, rank: .two)
    static let e3 = Self(file: .e, rank: .three)
    static let e4 = Self(file: .e, rank: .four)
    static let e5 = Self(file: .e, rank: .five)
    static let e6 = Self(file: .e, rank: .six)
    static let e7 = Self(file: .e, rank: .seven)
    static let e8 = Self(file: .e, rank: .eight)
    
    // MARK: file `f`
    static let f1 = Self(file: .f, rank: .one)
    static let f2 = Self(file: .f, rank: .two)
    static let f3 = Self(file: .f, rank: .three)
    static let f4 = Self(file: .f, rank: .four)
    static let f5 = Self(file: .f, rank: .five)
    static let f6 = Self(file: .f, rank: .six)
    static let f7 = Self(file: .f, rank: .seven)
    static let f8 = Self(file: .f, rank: .eight)
    
    // MARK: file `g`
    static let g1 = Self(file: .g, rank: .one)
    static let g2 = Self(file: .g, rank: .two)
    static let g3 = Self(file: .g, rank: .three)
    static let g4 = Self(file: .g, rank: .four)
    static let g5 = Self(file: .g, rank: .five)
    static let g6 = Self(file: .g, rank: .six)
    static let g7 = Self(file: .g, rank: .seven)
    static let g8 = Self(file: .g, rank: .eight)
    
    // MARK: file `h`
    static let h1 = Self(file: .h, rank: .one)
    static let h2 = Self(file: .h, rank: .two)
    static let h3 = Self(file: .h, rank: .three)
    static let h4 = Self(file: .h, rank: .four)
    static let h5 = Self(file: .h, rank: .five)
    static let h6 = Self(file: .h, rank: .six)
    static let h7 = Self(file: .h, rank: .seven)
    static let h8 = Self(file: .h, rank: .eight)
}
