import UIKit
import Wall

public class CampaignController: WallController {

  public var campaign: Campaign?

  var campaignConfig: Config.Campaign {
    return (config as! Config).campaign
  }

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
      let dateFormatter = campaignConfig.dateFormatter
      let startDateString = dateFormatter.stringFromDate(campaign.startDate)
      let endDateString = dateFormatter.stringFromDate(campaign.endDate)
      "\(startDateString) - \(endDateString)"

      posts += campaign.contentSections
      posts += campaign.productSections
    }

    return posts
  }
}
