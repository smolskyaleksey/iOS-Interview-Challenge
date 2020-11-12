import Foundation

protocol MediaPlayer {
    associatedtype Media
    
    func play(media: Media)
}
