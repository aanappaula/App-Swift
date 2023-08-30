struct HeroesVillains: Decodable {
    let name: String
    let image: ImageAPI
    let biography: Biography
}

struct Biography: Decodable {
    let fullName: String
    let firsAppearence: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case firsAppearence = "first-appearance"
    }
}

struct ImageAPI: Decodable {
    let url: String
}
