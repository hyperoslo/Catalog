import UIKit
import Wall

public class CatalogController: WallController, CategoryCellNodeDelegate {

  public var category: Category?
  public var catalogConfig = Config()

  public var headerPost: Post? {
    var post: Post?
    if catalogConfig.catalog.header.enabled {
      if let category = category {
        var string = catalogConfig.catalog.footer.text.string
        post = Post(text: string, date: category.publishDate)
        post!.title = category.title
      }
    }
    return post
  }

  public var footerPost: Post? {
    var post: Post?
    if catalogConfig.catalog.footer.enabled {
      if let category = category {
        post = Post(
          text: catalogConfig.catalog.footer.text.string,
          date: category.publishDate)
      }
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
    dataSource = CatalogDataSource(delegate: self, config: catalogConfig)
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
      if let headerPost = headerPost {
        posts.append(headerPost)
      }
      posts += category.contentSections
      posts += category.cardSections
      if let footerPost = footerPost {
        posts.append(footerPost)
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
