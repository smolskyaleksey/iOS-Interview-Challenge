import Foundation

enum CacheService {
    static func cache(photos: [NetworkService.Photo]) throws {
        print("Cache \(photos) to Database")
    }
}
