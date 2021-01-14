import UIKit

class BaseViewController: UIViewController {
    func showAlert() { print("Show UIAlertController") }
}

class PhotoViewController: BaseViewController {
    var photoPreviewer: PhotoPreviewer?
    var photos = [Photo]()
    var networkService = NetworkService.shared
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        networkService.urlString = "https://i.pinimg.com/564x/da/43/ed/da43ed6a297ec1fb5aedc9b7b6cb7d76"
        networkService.load { photos in
            photos.map {
                self.photos = $0
                self.updateUI(with: $0)
            }
        }
    }
    
    func updateUI(with photos: [Photo]) {
        print("Update UI with photos: \(photos)")
    }
    
    @IBAction func onPreview(_ sender: UIButton) {
        photoPreviewer?.preview(photo: photos[sender.tag])
    }
    
    @IBAction func onSave() {
        do {
            try NetworkService.shared.cachePhotos()
        } catch {
            showAlert()
        }
    }
}
