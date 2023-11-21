import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [PostModel] = []

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
