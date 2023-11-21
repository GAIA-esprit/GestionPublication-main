import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private let baseURL = "http://localhost:3000/api" // Update with your backend URL

    func getPosts(completion: @escaping (Result<[PostModel], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/posts") else {
            completion(.failure(NetworkError.invalidURL(url: "\(baseURL)/posts")))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let posts = json["posts"] as? [[String: Any]] {
                    let jsonData = try JSONSerialization.data(withJSONObject: posts, options: .prettyPrinted)
                    let decodedPosts = try JSONDecoder().decode([PostModel].self, from: jsonData)
                    completion(.success(decodedPosts))
                } else {
                    throw DecodingError.typeMismatch([PostModel].self, DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array but found a dictionary instead."))
                }
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }

}

enum NetworkError: Error {
    case invalidURL(url: String)
    case noData
}
