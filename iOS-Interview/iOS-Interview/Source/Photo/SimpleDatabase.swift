import UIKit

enum SimpleDatabase {
    static func cache(withPath path: String, photos: [Photo]) throws {
        print("Cache \(photos) to Database with path: \(path)")
    }
}
