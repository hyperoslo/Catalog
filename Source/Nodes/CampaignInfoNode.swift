import UIKit
import AsyncDisplayKit
import Wall

public class CampaignInfoNode: ASDisplayNode {

  let config: Config
  let width: CGFloat

  var titleNode: ASTextNode?
  var textNode: ASTextNode?

  var infoConfig: Config.Campaign.Info {
    return config.campaign.info
  }

  // MARK: - Initialization

  public init(config: Config, post: Post, width: CGFloat) {
    self.config = config
    self.width = width

    super.init()

    if let title = post.title {
      titleNode = ASTextNode()
      titleNode!.attributedString = NSAttributedString(
        string: title,
        attributes: infoConfig.title.textAttributes)
      addSubnode(titleNode)
    }

    if let text = post.text {
      textNode = ASTextNode()
      textNode!.attributedString = NSAttributedString(
        string: text,
        attributes: infoConfig.text.textAttributes)
      addSubnode(textNode)
    }
  }

  // MARK: - Layout

  override public func calculateSizeThatFits(constrainedSize: CGSize) -> CGSize {
    var height: CGFloat = infoConfig.verticalPadding

    if let titleNode = titleNode {
      let size = titleNode.measure(CGSize(
        width: width,
        height: CGFloat(FLT_MAX)))
      height += size.height + infoConfig.verticalPadding
    }

    if let textNode = textNode {
      let size = textNode.measure(CGSize(
        width: width,
        height: CGFloat(FLT_MAX)))
      height += size.height + infoConfig.verticalPadding
    }

    return CGSizeMake(width, height)
  }

  override public func layout() {
    let padding = infoConfig.verticalPadding
    var y: CGFloat = padding

    if let titleNode = titleNode {
      let size = titleNode.calculatedSize
        titleNode.frame = CGRect(
          origin: CGPoint(x: 0, y: y),
          size: size)
        y += size.height + padding
    }

    if let textNode = textNode {
      let size = textNode.calculatedSize
      textNode.frame = CGRect(
        origin: CGPoint(x: 0, y: y),
        size: size)
    }
  }
}
