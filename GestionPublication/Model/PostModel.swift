struct PostModel: Identifiable, Codable, Hashable  {
    var id: String
    var iduser: String
    var title: String
    var content: String
    var author: String
    var like : Int
    var dislike : Int
    var __v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iduser
        case title
        case content
        case author
        case like
        case dislike
        case __v
    }
    
    init(id: String, iduser: String, title: String, content: String, author: String, like: Int, dislike: Int, __v: Int) {
        self.id = id
        self.iduser = iduser
        self.title = title
        self.content = content
        self.author = author
        self.like = like
        self.dislike = dislike
        self.__v = __v
    }
}
