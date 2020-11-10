import UIKit

struct NetworkService {
    static var shared = NetworkService()
    
    typealias Photo = UIImage
    
    var photos = [Photo]()
    
    var urlString: String!
        
    mutating func load(completion: ([Photo]?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        
        // Load from network by url
        
        let photosFromNetwork = [Photo(), Photo()]
        
        photos = photosFromNetwork
        completion(photos)
    }
    
    func cachePhotos() throws {
        try CacheService.cache(photos: photos)
    }
}
