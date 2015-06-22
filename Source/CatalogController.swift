import UIKit
import Wall

public class CatalogController: WallController, ListingCellNodeDelegate {

  public var listing: Listing?
  public var catalogConfig = Config()

  public var headerPost: Post? {
    var post: Post?
    if catalogConfig.catalog.header.enabled {
      if let listing = listing {
        var string = catalogConfig.catalog.footer.text.string
        post = Post(text: string, date: listing.publishDate)
        post!.title = listing.title
      }
    }
    return post
  }

  public var footerPost: Post? {
    var post: Post?
    if catalogConfig.catalog.footer.enabled {
      if let listing = listing {
        post = Post(
          text: catalogConfig.catalog.footer.text.string,
          date: listing.publishDate)
      }
    }
    return post
  }

  public convenience init(listing: Listing) {
    self.init()
    self.listing = listing
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    config = catalogConfig
    dataSource = CatalogDataSource(delegate: self, config: catalogConfig)
    collectionView.asyncDataSource = dataSource
    
    let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
    layout.footerReferenceSize = view.bounds.size

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

    if let listing = listing {
      if let headerPost = headerPost {
        posts.append(headerPost)
      }
      posts += listing.contentSections
      posts += listing.cardSections
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
