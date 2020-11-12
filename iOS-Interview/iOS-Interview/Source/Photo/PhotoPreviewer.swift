import Foundation

protocol PhotoPreviewer {
    func preview(photo: Photo)
    func next()
    func previous()
}
