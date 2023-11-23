import Foundation

struct CommentModel: Identifiable, Codable, Equatable {
    let id: String
    let postId: String
    let commenter: String
    let text: String
    let createdAt: Date
    let updatedAt: Date
    let __v: Int

    // Implement Equatable
    static func == (lhs: CommentModel, rhs: CommentModel) -> Bool {
        return lhs.id == rhs.id
    }
}
