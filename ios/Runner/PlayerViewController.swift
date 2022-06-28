import Foundation
import UIKit

class PlayerViewController : UIViewController {

    let lblName = UILabel(frame: CGRect(x: 100, y: 100, width: 500, height: 500))

    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = "Name:"
        lblName.font.withSize(100)
        lblName.textColor = UIColor.red
        
        self.view.addSubview(lblName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
