import UIKit
import Wall

public class CampaignController: WallController, CampaignCellNodeDelegate {

  public var campaign: Campaign?
  public var campaignConfig = Config()

  public var infoPost: Post? {
    var post: Post?
    if let campaign = campaign {
      let dateFormatter = campaignConfig.campaign.dateFormatter
      let startDateString = dateFormatter.stringFromDate(campaign.startDate)
      let endDateString = dateFormatter.stringFromDate(campaign.endDate)
      let infoText = "\(startDateString) - \(endDateString)"

      post = Post(text: infoText, date: campaign.publishDate)
      post!.title = campaign.title
    }
    return post
  }

  public var readySectionPost: Post? {
    var post: Post?
    if let campaign = campaign {
      post = Post(
        text: campaignConfig.campaign.readySection.text.infoText,
        date: campaign.publishDate)
    }
    return post
  }

  public convenience init(campaign: Campaign) {
    self.init()
    self.campaign = campaign
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    config = campaignConfig
    dataSource = CampaignDataSource(delegate: self)
    collectionView.asyncDataSource = dataSource

    config.wall.post.header.enabled = false
    config.wall.post.footer.enabled = false
    config.wall.post.actionBar.enabled = false
    config.wall.post.title.enabled = true
  }

  public func reloadPosts() {
    var posts = [Post]()

    if let campaign = campaign {
      if let infoPost = infoPost {
        posts.append(infoPost)
      }
      posts += campaign.contentSections
      posts += campaign.productSections
      if let readySectionPost = readySectionPost {
        posts.append(readySectionPost)
      }
    }

    let delayTime = dispatch_time(
      DISPATCH_TIME_NOW,
      Int64(0.1 * Double(NSEC_PER_SEC)))

    dispatch_after(delayTime, dispatch_get_main_queue()) {
      self.posts = posts
    }
  }
}
