import SwiftUI

struct CommentView: View {
    @ObservedObject var commentViewModel = CommentViewModel()
    @State private var newCommentText: String = ""
    let postId: String

    var body: some View {
        VStack {
            // Display existing comments
            List(commentViewModel.comments, id: \.postId) { comment in
                Text(comment.commenter + ": " + comment.text)
            }

            // Add a new comment
            HStack {
                TextField("Add a comment", text: $newCommentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Post") {
                    // Call the CommentViewModel method to add the comment
                    let newComment = CommentModel(id: "", postId: postId, commenter: "JohnDoe", text: newCommentText, createdAt: Date(), updatedAt: Date(), __v: 0)
                    
                    
                    commentViewModel.createComment(comment: newComment)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            commentViewModel.fetchComments(for: postId)
                        }

                }
                .padding(.leading, 8)
            }
            .padding()
        }
        .navigationTitle("Comments")
        .onAppear {
            // Fetch comments when the view appears
            commentViewModel.fetchComments(for: postId)
        }
        .onChange(of: commentViewModel.comments) { _ in
            // Fetch comments after the comment creation request has been processed
            commentViewModel.fetchComments(for: postId)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(postId: "123123")
    }
}
