import UIKit
import Wall

public class CatalogController: WallController, CategoryCellNodeDelegate {

  public var category: Category?
  public var catalogConfig = Config()

  public var infoPost: Post? {
    var post: Post?
    if let category = category {
      var infoText: String?

      if let startDate = category.startDate, endDate = category.endDate {
        let dateFormatter = catalogConfig.campaign.dateFormatter

        let startDateString = dateFormatter.stringFromDate(startDate)
        let endDateString = dateFormatter.stringFromDate(endDate)
        infoText = "\(startDateString) - \(endDateString)"
      }

      post = Post(text: infoText, date: category.publishDate)
      post!.title = category.title
    }
    return post
  }

  public var readySectionPost: Post? {
    var post: Post?
    if let category = category {
      post = Post(
        text: catalogConfig.campaign.readySection.text.infoText,
        date: category.publishDate)
    }
    return post
  }

  public convenience init(category: Category) {
    self.init()
    self.category = category
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    config = catalogConfig
    dataSource = CatalogDataSource(delegate: self)
    collectionView.asyncDataSource = dataSource

    config.wall.post.header.enabled = false
    config.wall.post.footer.enabled = false
    config.wall.post.actionBar.enabled = false
    config.wall.post.title.enabled = true
    config.wall.post.title.uppercase = true
    config.wall.post.divider.enabled = false
    config.wall.post.attachments.gridType = .FullWidth
  }

  public func reloadPosts() {
    var posts = [Post]()

    if let category = category {
      if let infoPost = infoPost {
        posts.append(infoPost)
      }
      posts += category.contentSections
      posts += category.cardSections
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
