import Foundation

class ContentViewModel {
    var contents: [ContentModel] = []

    init() {
        guard let jsonURL = urlPathForDemoPayload(),
              let content = loadJSONFromFile(atURL: jsonURL) else {
            print("Failed to load content from JSON.")
            return
        }
        contents = content
    }

    private func urlPathForDemoPayload() -> URL? {
        guard let resourePath = Bundle.module.resourcePath else {
            print("Unable to find the bundle resource path.")
            return nil
        }
        let jsonURL = URL(fileURLWithPath: resourePath).appendingPathComponent("DemoPayload.json")
        guard FileManager.default.fileExists(atPath: jsonURL.path) else {
            print("DemoPayload.json does not exist at expected path: \(jsonURL.path)")
            return nil
        }
        return jsonURL
    }

    private func loadJSONFromFile(atURL url: URL) -> [ContentModel]? {
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to locate or load DemoPayload.json")
            return nil
        }

        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([ContentModel].self, from: data)
            return decodedData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
