import UIKit
import AsyncDisplayKit
import Wall

public class SectionCellNode: PostCellNode {

  var statusNode: ASImageNode?

  var catalogConfig: Config? {
    var config: Config?
    if let delegate = delegate as? ListingCellNodeDelegate {
      config = delegate.catalogConfig
    }

    return config
  }

  // MARK: - Initialization

  public override init(post: Post, width: CGFloat, _ delegate: AnyObject? = nil) {
    super.init(post: post, width: width, delegate)

    let delegate = delegate as? ListingCellNodeDelegate

    if let config = catalogConfig {
      let statusIconConfig = config.catalog.contentSection.statusIcon
      if statusIconConfig.enabled {
        statusNode = ASImageNode()
        statusNode?.backgroundColor = post.read
          ? statusIconConfig.selectedBackgroundColor
          : statusIconConfig.backgroundColor
        statusNode?.image = post.read ?
          statusIconConfig.image
          : statusIconConfig.selectedImage

        if statusIconConfig.rounded {
          statusNode?.cornerRadius = statusIconConfig.size.width / 2
          statusNode?.clipsToBounds = true
        }

        addSubnode(statusNode)
      }
    }
  }

  // MARK: - Layout

  public override func layout() {
    super.layout()

    if let config = catalogConfig {
      let statusIconConfig = config.catalog.contentSection.statusIcon

      if let statusNode = statusNode {
        let size = statusIconConfig.size
        statusNode.frame = CGRect(
          x: width - statusIconConfig.horizontalPadding,
          y: statusIconConfig.verticalPadding,
          width: size.width,
          height: size.height)
      }
    }
  }
}
