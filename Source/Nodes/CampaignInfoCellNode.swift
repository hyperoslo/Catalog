import UIKit
import AsyncDisplayKit
import Wall

public class CampaignInfoCellNode: ASCellNode {

  public let width: CGFloat
  public var delegate: CampaignCellNodeDelegate?
  public var config: Config?

  var titleNode: ASTextNode?
  var textNode: ASTextNode?

  // MARK: - Initialization

  public init(post: Post, width: CGFloat, _ delegate: AnyObject? = nil) {
    self.width = width
    self.delegate = delegate as? CampaignCellNodeDelegate
    self.config = self.delegate?.campaignConfig

    super.init()

    if let config = config {
      let infoConfig = config.campaign.info

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
  }

  // MARK: - Layout

  override public func calculateSizeThatFits(constrainedSize: CGSize) -> CGSize {
    var height: CGFloat = 0

    if let config = config {
      let infoConfig = config.campaign.info
      height = infoConfig.verticalPadding

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
    }

    return CGSizeMake(width, height)
  }

  override public func layout() {
    if let config = config {
      let infoConfig = config.campaign.info

      let padding = infoConfig.verticalPadding
      var y: CGFloat = padding

      if let titleNode = titleNode {
        let size = titleNode.calculatedSize
        titleNode.frame = CGRect(
          x: 0, y: y,
          width: width, height: size.height)
        y += size.height + padding
      }

      if let textNode = textNode {
        let size = textNode.calculatedSize
        textNode.frame = CGRect(
          x: 0, y: y,
          width: width, height: size.height)
      }
    }
  }
}
