import UIKit
import AsyncDisplayKit
import Wall

public class CampaignInfoCellNode: ASCellNode {

  public let width: CGFloat
  public var delegate: CampaignCellNodeDelegate?
  public var config: Config?

  var titleNode: ASTextNode?
  var textNode: ASTextNode?
  var divider: ASDisplayNode?

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

      if infoConfig.divider.enabled {
        divider = ASDisplayNode()
        divider!.backgroundColor = infoConfig.divider.backgroundColor
        addSubnode(divider)
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

      if let divider = divider {
        height += infoConfig.divider.height + infoConfig.verticalPadding
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
        y += size.height + padding
      }

      if let divider = divider {
        let dividerWidth = width - 2 * infoConfig.divider.horizontalPadding
        divider.frame = CGRect(
          x: infoConfig.divider.horizontalPadding, y: y,
          width: dividerWidth,
          height: infoConfig.divider.height)
      }
    }
  }
}
