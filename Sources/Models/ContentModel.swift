import Foundation

struct ContentModel: Codable, Identifiable {
    let id: String
    let title: String
    let html: String
    let javaScript: String
    let css: String

    init(id: String, title: String, html: String, javaScript: String, css: String) {
        self.id = id
        self.title = title
        self.html = html
        self.javaScript = javaScript
        self.css = css
    }

    enum CodingKeys: String, CodingKey {
        case id, title, html, css
        case javaScript = "js"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.html = try container.decode(String.self, forKey: .html)
        self.javaScript = try container.decode(String.self, forKey: .javaScript)
        self.css = try container.decode(String.self, forKey: .css)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(html, forKey: .html)
        try container.encode(javaScript, forKey: .javaScript)
        try container.encode(css, forKey: .css)
    }
}
