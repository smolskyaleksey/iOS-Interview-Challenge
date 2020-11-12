import UIKit

class NetworkProvider {
    typealias Photos = [Photo]
    
    func load(url: URL) -> Photos {
        [Photo(), Photo()]
    }
}
