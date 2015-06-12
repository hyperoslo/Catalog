import UIKit
import AsyncDisplayKit

public class CampaignHeaderNode: ASControlNode {

  let config: Config
  let width: CGFloat

  var titleNode: ASTextNode
  var dateNode: ASTextNode

  var headerConfig: Config.Campaign.Header {
    return config.campaign.header
  }

  // MARK: - Initialization

  public init(config: Config, campaign: Campaign, width: CGFloat) {
    self.config = config
    self.width = width

    titleNode = ASTextNode()
    dateNode = ASTextNode()

    super.init()

    titleNode.attributedString = NSAttributedString(
      string: campaign.title,
      attributes: headerConfig.title.textAttributes)

    let dateFormatter = config.campaign.dateFormatter
    let startDateString = dateFormatter.stringFromDate(campaign.startDate)
    let endDateString = dateFormatter.stringFromDate(campaign.endDate)

    dateNode.attributedString = NSAttributedString(
      string: "\(startDateString) - \(endDateString)",
      attributes: headerConfig.date.textAttributes)

    addSubnode(titleNode)
    addSubnode(dateNode)
  }

  // MARK: - Layout

  override public func calculateSizeThatFits(constrainedSize: CGSize) -> CGSize {
    var height: CGFloat = headerConfig.padding * 3

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
    let padding = headerConfig.padding
    var y: CGFloat = padding

    let titleSize = titleNode.calculatedSize
    titleNode.frame = CGRect(
      origin: CGPoint(x: 0, y: y),
      size: titleSize)
    y += titleSize.height + padding

    let dateSize = dateNode.calculatedSize
    dateNode.frame = CGRect(
      origin: CGPoint(x: 0, y: y),
      size: dateSize)
  }
}
