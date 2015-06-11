import UIKit
import Wall

public class CampaignController: WallController {

  public var campaign: Campaign?

  convenience init(campaign: Campaign) {
    self.init()
    self.config = Config()
    self.campaign = campaign
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    config.wall.post.header.enabled = false
    config.wall.post.footer.enabled = false
    config.wall.post.actionBar.enabled = false
  }

  func generatePosts() -> [Post] {
    var posts = [Post]()

    return posts
  }
}
