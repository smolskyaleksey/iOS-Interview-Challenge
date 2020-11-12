import UIKit

typealias Photo = UIImage

struct NetworkService {
    static var shared = NetworkService()
    
    var photos: [Photo]?
    var urlString: String!
        
    mutating func load(completion: ([Photo]?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            fatalError("Wrong urlString or url")
        }
        
        let provider = NetworkProvider()
        let photos = provider.load(url: url)
        self.photos = photos
        
        completion(photos)
    }
    
    func cachePhotos() throws {
        if let photos = photos {
            try SimpleDatabase.cache(withPath: urlString, photos: photos)
        }
    }
}
