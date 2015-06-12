import UIKit
import AsyncDisplayKit
import Wall

public class CampaignReadyNode: ASDisplayNode {

  let config: Config
  let width: CGFloat

  var textNode: ASTextNode?

  var sectionConfig: Config.Campaign.ReadySection {
    return config.campaign.readySection
  }

  // MARK: - Initialization

  public init(config: Config, post: Post, width: CGFloat) {
    self.config = config
    self.width = width

    super.init()

    if let text = post.text {
      textNode = ASTextNode()
      textNode!.attributedString = NSAttributedString(
        string: text,
        attributes: sectionConfig.text.textAttributes)
      addSubnode(textNode)
    }
  }

  // MARK: - Layout

  override public func calculateSizeThatFits(constrainedSize: CGSize) -> CGSize {
    var height: CGFloat = sectionConfig.verticalPadding

    if let textNode = textNode {
      let size = textNode.measure(CGSize(
        width: width,
        height: CGFloat(FLT_MAX)))
      height += size.height + sectionConfig.verticalPadding
    }

    return CGSizeMake(width, height)
  }

  override public func layout() {
    let padding = sectionConfig.verticalPadding
    var y: CGFloat = padding

    if let textNode = textNode {
      let size = textNode.calculatedSize
      textNode.frame = CGRect(
        origin: CGPoint(x: 0, y: y),
        size: size)
    }
  }
}
