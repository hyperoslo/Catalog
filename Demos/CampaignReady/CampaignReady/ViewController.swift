import UIKit
import Wall
import Catalog

class ViewController: CatalogController {

  let generator = ContentGenerator()

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Campaign Ready"

    config.wall.thumbnailForAttachment = {
      (attachment: Attachment, size: CGSize) -> URLStringConvertible? in
      return String(format: attachment.thumbnail!.string,
        Int(size.width), Int(size.height))
    }
    config.wall.post.title.textAttributes[NSFontAttributeName] = UIFont.boldSystemFontOfSize(18)
    catalogConfig.catalog.contentSection.statusIcon.rounded = true

    listing = generator.listing()
    reloadPosts()
  }
}
