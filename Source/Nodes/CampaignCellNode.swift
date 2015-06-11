import UIKit
import AsyncDisplayKit
import Wall

public class CampaignCellNode: PostCellNode {

  // MARK: - Initialization

  public init(post: Post, config: Config, width: CGFloat, _ delegate: AnyObject? = nil) {
    super.init(post: post, width: width, delegate)
  }
}
