import UIKit
import Wall

public class CampaignController: WallController {

  public var campaign: Campaign?

  convenience init(campaign: Campaign) {
    self.init()
    self.campaign = campaign
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    Config.Wall.Post.Header.enabled = false
    Config.Wall.Post.Footer.enabled = false
    Config.Wall.Post.ActionBar.enabled = false
  }
}
