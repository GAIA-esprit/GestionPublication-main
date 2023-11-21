struct PostModel: Identifiable, Codable, Hashable  {
    var id: String
    var iduser: String
    var title: String
    var content: String
    var author: String
    var __v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iduser
        case title
        case content
        case author
        case __v
    }
}
