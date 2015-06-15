import UIKit
import AsyncDisplayKit
import Wall

public class CampaignCellNode: PostCellNode {

  var statusNode: ASImageNode?

  var campaignConfig: Config? {
    var config: Config?
    if let delegate = delegate as? CampaignCellNodeDelegate {
      config = delegate.campaignConfig
    }

    return config
  }

  // MARK: - Initialization

  public override init(post: Post, width: CGFloat, _ delegate: AnyObject? = nil) {
    super.init(post: post, width: width, delegate)

    let delegate = delegate as? CampaignCellNodeDelegate

    if let config = campaignConfig {
      let statusIconConfig = config.campaign.content.statusIcon
      if statusIconConfig.enabled {
        statusNode = ASImageNode()
        statusNode?.backgroundColor = post.read
          ? statusIconConfig.selectedBackgroundColor
          : statusIconConfig.backgroundColor
        statusNode?.image = post.read ?
          statusIconConfig.image
          : statusIconConfig.selectedImage

        addSubnode(statusNode)
      }
    }
  }

  // MARK: - Layout

  public override func layout() {
    super.layout()

    if let config = campaignConfig {
      let statusIconConfig = config.campaign.content.statusIcon

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
