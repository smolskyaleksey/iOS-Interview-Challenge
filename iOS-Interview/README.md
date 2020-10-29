# iOS Interview project

### Async app launch

```swift
var indices = [Int]()

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    for index in 0..<20 {
        DispatchQueue.main.async {
            self.indices.append(index)
        }
    }
    return true
}
```

### Refactoring

```swift
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
        print("Cache \(photos)")
    }
}

class PhotoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.load { photos in
            photos.map { self.updateUI(with: $0) }
        }
    }
    
    func updateUI(with photos: [NetworkService.Photo]) {
        // update UI
    }
    
    func cachePhotos() {
        try! NetworkService.shared.cachePhotos()
    }
}
```
