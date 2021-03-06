import UIKit
import AsyncDisplayKit
import Wall

public class FooterCellNode: ASCellNode {

  public let width: CGFloat
  public var delegate: ListingCellNodeDelegate?
  public let config: Config?

  var divider: ASDisplayNode?
  var textNode: ASTextNode?

  var contentWidth: CGFloat {
    var contentWidth = width
    if let config = delegate?.catalogConfig {
      contentWidth = width - 2 * config.catalog.footer.horizontalPadding
    }
    return contentWidth
  }

  // MARK: - Initialization

  public init(post: Post, width: CGFloat, _ delegate: AnyObject? = nil) {
    self.width = width
    self.delegate = delegate as? ListingCellNodeDelegate
    self.config = self.delegate?.catalogConfig

    super.init()

    if let config = config {
      let sectionConfig = config.catalog.footer

      if sectionConfig.divider.enabled {
        divider = ASDisplayNode()
        divider!.backgroundColor = sectionConfig.divider.backgroundColor
        addSubnode(divider)
      }

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
      let sectionConfig = config.catalog.footer
      let padding = sectionConfig.verticalPadding

      height = padding * 2

      if let divider = divider {
        height += sectionConfig.divider.height + padding
      }

      if let textNode = textNode {
        let size = textNode.measure(CGSize(
          width: width,
          height: CGFloat(FLT_MAX)))
        height += size.height + padding
      }
    }

    return CGSizeMake(width, height)
  }

  override public func layout() {
    if let config = config {
      let sectionConfig = config.catalog.footer

      let padding = sectionConfig.verticalPadding
      var y: CGFloat = padding

      if let divider = divider {
        let dividerWidth = width - 2 * sectionConfig.divider.horizontalPadding
        divider.frame = CGRect(
          x: sectionConfig.divider.horizontalPadding, y: y,
          width: dividerWidth,
          height: sectionConfig.divider.height)
        y += padding
      }

      if let textNode = textNode {
        let size = textNode.calculatedSize
        textNode.frame = CGRect(
          x: sectionConfig.horizontalPadding, y: y,
          width: contentWidth, height: size.height)
      }
    }
  }
}
