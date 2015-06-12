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

    posts = generatePosts()
    
    config.wall.post.header.enabled = false
    config.wall.post.footer.enabled = false
    config.wall.post.actionBar.enabled = false
    config.wall.post.title.enabled = true
  }

  func generatePosts() -> [Post] {
    var posts = [Post]()

    if let campaign = campaign {
      posts += campaign.contentSections
      posts += campaign.productSections
    }

    return posts
  }
}
