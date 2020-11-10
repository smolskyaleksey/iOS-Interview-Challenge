import UIKit

enum SimpleDatabase {
    static func cache(photos: [Photo]) throws {
        print("Cache \(photos) to Database")
    }
}
