import SwiftUI

struct NewTweetView: View {
    @StateObject var vf = PostViewModel()
    @State var author: String = ""
    @State var iduser: String = ""
    @State var title: String = ""
    @State var like: Int = 0
    @State var dislike: Int = 0
    @State var content: String = ""
    @State private var showAlert = false
    @State private var publicationAddedSuccessfully = false
    @State private var navigateToContentView = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Ajouter Post")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    TextEditor(text: $content)
                        .frame(height: 100)
                        .padding()
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(10)

                    Button(action: {
                        showAlert.toggle()
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title)
                            Text("Ajouter")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                }
                .padding(.horizontal, 20)
                .background(
                    NavigationLink(
                        destination: FeedView(),
                        isActive: $navigateToContentView
                    ) {
                        EmptyView()
                    }
                    .hidden()
                )
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Êtes-vous sûr de vouloir poster cette publication?"),
                message: Text("Votre nouvelle publication sera enregistrée."),
                primaryButton: .default(Text("Annuler")),
                secondaryButton: .default(Text("OK")) {
                    publicationAddedSuccessfully = true
                    navigateToContentView = true
                }
            )
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
