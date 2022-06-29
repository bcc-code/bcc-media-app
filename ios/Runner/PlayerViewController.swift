import AVFoundation
import AVKit
import UIKit

extension CMTime {
    var asDouble: Double {
        get {
            return Double(self.value) / Double(self.timescale)
        }
    }
    var asFloat: Float {
        get {
            return Float(self.value) / Float(self.timescale)
        }
    }
}

extension CMTime: CustomStringConvertible {
    public var description: String {
        get {
            let seconds = Int(round(self.asDouble))
            return String(format: "%02d:%02d", seconds / 60, seconds % 60)
        }
    }
}

class PlayerView: UIView {
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

public class PlayerViewController: UIViewController {
    
    var playButton: UIButton!
    var exitButton: UIButton!
    var playerView: PlayerView!
    var playerTimeLabel: UILabel!
    var seekSlider: UISlider!
    var isActive: Bool = false
    var videoURL: URL!
    
    var duration: CMTime {
        return self.playerView.player!.currentItem!.asset.duration
    }
    
    convenience init(url: String) {
        self.init()
        self.videoURL = URL(string: url)!
    }
    
    public override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        self.playButton = setPlayButton()
        self.exitButton = createExitButton()
        self.playerView = setPlayerView()
        self.playerTimeLabel = setTextLabel(cmtime: CMTime.zero)
        print(self.duration)
        self.seekSlider = setSeekSlider()
        playerView.player?.addPeriodicTimeObserver(
            forInterval: CMTime(seconds: 1, preferredTimescale: 100),
            queue: DispatchQueue.main,
            using: { [weak self] (cmtime) in
                print(cmtime)
                self?.playerTimeLabel.text = cmtime.description
        })
        self.view.addSubview(playerView)
        self.view.addSubview(seekSlider)
        self.view.addSubview(playerTimeLabel)
        self.view.addSubview(playButton)
        self.view.addSubview(exitButton)
        self.playerView.player?.play()
        isActive = true
    }
    
    private func setTextLabel(cmtime: CMTime) -> UILabel {
        let label = UILabel()
        label.text = cmtime.description
        label.frame = CGRect(x: 0, y: 350, width: 100, height: 50)
        return label
    }
    
    private func setSeekSlider() -> UISlider {
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 400, width: 320, height: 50)
        slider.addTarget(
            self,
            action: #selector(self.changeSeekSlider(_:)),
            for: .valueChanged)
        return slider
    }
    
    @objc func changeSeekSlider(_ sender: UISlider) {
        let seekTime = CMTime(seconds: Double(sender.value) * self.duration.asDouble, preferredTimescale: 100)
        self.seekToTime(seekTime)
    }
    
    private func seekToTime(_ seekTime: CMTime) {
        print(seekTime)
        self.playerView.player?.seek(to: seekTime)
        self.playerTimeLabel.text = seekTime.description
    }
    
    private func setPlayerView() -> PlayerView {
        let player = AVPlayer(url: self.videoURL)
        let playerView = PlayerView(frame: self.view.layer.bounds)
        playerView.player = player
        playerView.playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        return playerView
    }
    
    private func createExitButton() -> UIButton {
        let btn = UIButton()
        btn.frame = CGRect(x: self.view.layer.bounds.width - 200, y: 75, width: 200, height: 100)
        btn.backgroundColor = UIColor.red
        btn.layer.masksToBounds = true
        btn.setTitle("Exit", for: .normal)
        btn.layer.cornerRadius = 8.0
        btn.addTarget(
            self,
            action: #selector(self.exitButtonClicked(_:)),
            for: .touchUpInside)
        return btn
    }
    
    @objc func exitButtonClicked(_ sender: UIButton) {
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        self.dismiss(animated: true)
    }
    
    private func setPlayButton() -> UIButton {
        let playButton = UIButton()
        playButton.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        playButton.backgroundColor = UIColor.blue
        playButton.layer.masksToBounds = true
        playButton.setTitle("PLAY", for: .normal)
        playButton.layer.cornerRadius = 8.0
        playButton.addTarget(
            self,
            action: #selector(self.clickPlayButton(_:)),
            for: .touchUpInside)
        return playButton
    }
    
    @objc func clickPlayButton(_ sender: UIButton) {
        playButton.setTitle(isActive ? "PLAY" : "STOP", for: .normal)
        isActive ? playerView.player?.pause() : playerView.player?.play()
        self.isActive = !self.isActive
        print("clicked -> \(isActive)")
    }
}
