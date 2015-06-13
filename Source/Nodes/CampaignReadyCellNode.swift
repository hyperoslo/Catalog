import UIKit
import AsyncDisplayKit
import Wall

public class CampaignReadyCellNode: ASCellNode {

  public let width: CGFloat
  public var delegate: CampaignCellNodeDelegate?
  public let config: Config?

  var textNode: ASTextNode?

  // MARK: - Initialization

  public init(post: Post, width: CGFloat, _ delegate: AnyObject? = nil) {
    self.width = width
    self.delegate = delegate as? CampaignCellNodeDelegate
    self.config = self.delegate?.campaignConfig

    super.init()

    if let config = config {
      let sectionConfig = config.campaign.readySection

      if let text = post.text {
        textNode = ASTextNode()
        textNode!.attributedString = NSAttributedString(
          string: text,
          attributes: sectionConfig.text.textAttributes)
        addSubnode(textNode)
      }
    }
  }

  // MARK: - Layout

  override public func calculateSizeThatFits(constrainedSize: CGSize) -> CGSize {
    var height: CGFloat = 0

    if let config = config {
      let sectionConfig = config.campaign.readySection

      height = sectionConfig.verticalPadding

      if let textNode = textNode {
        let size = textNode.measure(CGSize(
          width: width,
          height: CGFloat(FLT_MAX)))
        height += size.height + sectionConfig.verticalPadding
      }
    }

    return CGSizeMake(width, height)
  }

  override public func layout() {
    if let config = config {
      let sectionConfig = config.campaign.readySection

      let padding = sectionConfig.verticalPadding
      var y: CGFloat = padding

      if let textNode = textNode {
        let size = textNode.calculatedSize
        textNode.frame = CGRect(
          x: 0, y: y,
          width: width, height: size.height)
      }
    }
  }
}
