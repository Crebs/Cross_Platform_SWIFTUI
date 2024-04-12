import Foundation

struct CustomID {
    let id: Int

    init() {
        self.id = Int.random(in: 1..<Int.max)
    }

    init(id: Int) {
        self.id = id
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.id = try container.decode(Int.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(id)
    }
}

extension CustomID: Equatable, Hashable {
    static func == (lhs: CustomID, rhs: CustomID) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
