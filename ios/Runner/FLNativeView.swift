import Flutter
import UIKit
import AVKit

class BccmPlayerFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return BccmPlayerView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

class BccmPlayerView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private var _playerController: AVPlayerViewController?

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        print("given view size: \(frame)")
        _view = FLEmbedView(frame: frame)
        // iOS views can be created here
        super.init()
    }

    func view() -> UIView {
        return _view
    }
    
    deinit {
        
        _playerController?.player?.pause()
    }
}



class FLEmbedView : UIView {
  let _nativeLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
      appDelegate.playerViewController = PlayerViewController(url: "https://proxy.brunstad.tv/api/vod/toplevelmanifest?playbackUrl=https%3a%2f%2fvod.brunstad.tv%2f51284609-2605-4da0-8895-95fe908b23fb%2fINTR_S04_E04_MAS_NOR.ism%2fmanifest(format%3dm3u8-aapl%2caudio-only%3dfalse)&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cm46bWljcm9zb2Z0OmF6dXJlOm1lZGlhc2VydmljZXM6Y29udGVudGtleWlkZW50aWZpZXIiOiIwYTYzMjI4Yi0yNjRjLTQxNmUtODliOS00NzRhMWQ2MmJjMTYiLCJuYmYiOjE2NTY0ODY4OTQsImV4cCI6MTY1NjQ5Nzk5NCwiaXNzIjoiaHR0cHM6Ly9icnVuc3RhZC50diIsImF1ZCI6InVybjpicnVuc3RhZHR2In0.8CItrfCNxa--kr5h_y16kX_1G4QH4lgvd16rDG0LFVA&subs=false")
      
      self.addSubview(appDelegate.playerViewController!.view)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override func layoutSubviews() {
    print("current frame: \(self.frame)")
    //_nativeLabel.frame = CGRect(x: 10, y: 10, width: self.frame.width-20, height: self.frame.height-20)
    super.layoutSubviews()
  }
}
