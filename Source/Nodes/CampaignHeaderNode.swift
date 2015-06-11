import UIKit
import AsyncDisplayKit

public class CampaignHeaderNode: ASCellNode {

  let width: CGFloat

  var titleNode: ASTextNode
  var dateNode: ASTextNode

  // MARK: - Initialization

  public init(campaign: Campaign, width: CGFloat) {
    self.width = width

    titleNode = ASTextNode()
    titleNode.attributedString = NSAttributedString(
      string: campaign.title,
      attributes: nil)

    dateNode = ASTextNode()
    dateNode.attributedString = NSAttributedString(
      string: "",
      attributes: nil)

    super.init()

    addSubnode(titleNode)
    addSubnode(dateNode)
  }

  // MARK: - Layout

  override public func calculateSizeThatFits(constrainedSize: CGSize) -> CGSize {
    var height: CGFloat = 0

    let titleSize = titleNode.measure(CGSize(
      width: width,
      height: CGFloat(FLT_MAX)))
    height += titleSize.height

    let dateSize = dateNode.measure(CGSize(
      width: width,
      height: CGFloat(FLT_MAX)))
    height += dateSize.height

    return CGSizeMake(width, height)
  }

  override public func layout() {
    var y: CGFloat = 0

    let titleSize = titleNode.calculatedSize
    titleNode.frame = CGRect(
      origin: CGPoint(x: 0, y: y),
      size: titleSize)
    y += titleSize.height

    let dateSize = dateNode.calculatedSize
    dateNode.frame = CGRect(
      origin: CGPoint(x: 0, y: y),
      size: dateSize)
  }
}
