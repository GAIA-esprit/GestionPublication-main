import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        fetchPosts()
           }
    
    func likedPost(_ id:String){

            // Create an instance of JSONEncoder
            // Convert the Location structure into JSON data

        
            // Create a URLRequest with your API URL

        let url = URL(string: "http://localhost:3000/api/posts/\(id)/like")!

            var request = URLRequest(url: url)

            // Configure the request as a POST and set the request body

            request.httpMethod = "POST"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")


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
    
    func dislikedPost(_ id:String){

            // Create an instance of JSONEncoder
            // Convert the Location structure into JSON data

        
            // Create a URLRequest with your API URL

        let url = URL(string: "http://localhost:3000/api/posts/\(id)/dislike")!

            var request = URLRequest(url: url)

            // Configure the request as a POST and set the request body

            request.httpMethod = "POST"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")


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
        func addPost(_ post:PostModel) {

            // Create an instance of JSONEncoder
            let encoder = JSONEncoder()
            // Convert the Location structure into JSON data

            guard let jsonData = try? encoder.encode(post) else {

                fatalError("Error encoding to JSON")

            }
            // Create a URLRequest with your API URL

            let url = URL(string: "http://localhost:3000/api/posts/add")!

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
    
    // Fetch posts from the backend
    func fetchPosts() {
        print("Fetching posts...")
        NetworkManager.shared.getPosts { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.posts = posts
                    print("Fetched posts: \(posts)")
                }
            case .failure(let error):
                print("Failed to fetch posts: \(error.localizedDescription)")
            }
        }
    }

}
