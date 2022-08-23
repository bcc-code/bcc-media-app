
import Foundation
import AVKit

public class PlayerController {
    lazy var player: AVPlayer = AVPlayer()
    public var id: String = UUID().uuidString
    
    init() {
    }
    
    func takeOwnership(_ playerViewController: AVPlayerViewController) {
        playerViewController.player = player
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(true)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    func setPlayerItem(_ playerItem: AVPlayerItem, _ isLive: Bool = false) {
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
}

public class PlaybackApiImpl: NSObject, PlaybackPlatformPigeon {
    var players = [PlayerController]()
    
    public func getPlayer(id: String) -> PlayerController? {
        return players.first(where: { $0.id == id } )
    }
    
    public func newPlayer(_ url: String?, completion: @escaping (String?, FlutterError?) -> Void) {
        let player = PlayerController()
        players.append(player)
        if (url != nil) {
            player.setPlayerItem(AVPlayerItem(url: URL(string: url!)!))
        }
        completion(player.id, nil)
    }

    public func setUrl(_ setUrlArgs: SetUrlArgs, completion: @escaping (FlutterError?) -> Void) {
        let player = players.first(where: { $0.id == setUrlArgs.playerId })
        player?.setPlayerItem(
            AVPlayerItem(url: URL(string: setUrlArgs.playerId)!),
            (setUrlArgs.isLive?.boolValue != nil ? setUrlArgs.isLive?.boolValue : false)!
        )
        completion(nil)
    }

    public func setPrimary(_ id: String, completion: @escaping (FlutterError?) -> Void) {
        completion(nil)
    }

}
