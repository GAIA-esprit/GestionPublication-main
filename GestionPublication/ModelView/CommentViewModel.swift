import Foundation

class CommentViewModel: ObservableObject {
    // Add any necessary properties and other methods specific to comments
    @Published var comments: [CommentModel] = []
    func willSet() {
               objectWillChange.send()
           }
    func createComment(comment: CommentModel) {
        // Create an instance of JSONEncoder
        let encoder = JSONEncoder()

        // Convert the comment structure into JSON data
        guard let jsonData = try? encoder.encode(comment) else {
            fatalError("Error encoding to JSON")
        }

        // Create a URLRequest with your API URL
        guard let url = URL(string: "http://localhost:3000/api/comments/add") else {
            fatalError("Invalid API URL")
        }

        var request = URLRequest(url: url)

        // Configure the request as a POST and set the request body
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        // Use URLSession to send the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                return
            }

            // Process the response of the request
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")

                if let responseData = data {
                    // Process response data if needed
                    let responseString = String(data: responseData, encoding: .utf8)
                    print("Response: \(responseString ?? "")")
                }
            }
        }

        // Start the request
        task.resume()
    }
    func fetchComments(for postId: String) {
        guard let url = URL(string: "http://localhost:3000/api/comments/\(postId)") else {
            fatalError("Invalid API URL")
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }

            print("HTTP Status Code: \(httpResponse.statusCode)")

            if let responseData = data {
                do {
                    let decoder = JSONDecoder()
                    let comments = try decoder.decode([CommentModel].self, from: responseData)

                    DispatchQueue.main.async {
                        self.comments = comments
                    }
                } catch {
                    do {
                        let decoder = JSONDecoder()
                        let comment = try decoder.decode(CommentModel.self, from: responseData)
                        // Handle the case where a single comment is returned
                        DispatchQueue.main.async {
                            self.comments = [comment]
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                        // Print the response string to help debug
                        if let responseString = String(data: responseData, encoding: .utf8) {
                            print("Response String: \(responseString)")
                        }
                    }
                }
            } else {
                print("Response data is empty or nil.")
            }
        }

        task.resume()
    }
    // Add any other methods or properties related to comment operations
}
