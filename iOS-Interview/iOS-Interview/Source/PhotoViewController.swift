import UIKit

class PhotoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.load { photos in
            photos.map { self.updateUI(with: $0) }
        }
    }
    
    func updateUI(with photos: [Photo]) {
        print("Update UI with photos: \(photos)")
    }
    
    func cachePhotos() {
        try! NetworkService.shared.cachePhotos()
    }
}
