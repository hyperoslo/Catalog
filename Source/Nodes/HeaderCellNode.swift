import UIKit
import AsyncDisplayKit
import Wall

public class HeaderCellNode: ASCellNode {

  public let width: CGFloat
  public var delegate: CategoryCellNodeDelegate?
  public var config: Config?

  var titleNode: ASTextNode?
  var iconNode: ASImageNode?
  var textNode: ASTextNode?
  var divider: ASDisplayNode?

  // MARK: - Initialization

  public init(post: Post, width: CGFloat, _ delegate: AnyObject? = nil) {
    self.width = width
    self.delegate = delegate as? CategoryCellNodeDelegate
    self.config = self.delegate?.catalogConfig

    super.init()

    if let config = config {
      let infoConfig = config.catalog.header

      if let title = post.title {
        titleNode = ASTextNode()
        titleNode!.attributedString = NSAttributedString(
          string: title,
          attributes: infoConfig.title.textAttributes)
        addSubnode(titleNode)
      }

      if infoConfig.text.icon.enabled {
        iconNode = ASImageNode()
        iconNode!.backgroundColor = infoConfig.text.icon.placeholderColor
        iconNode!.image = infoConfig.text.icon.image

        addSubnode(iconNode)
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
      let infoConfig = config.catalog.header
      height = infoConfig.verticalPadding

      if let titleNode = titleNode {
        let size = titleNode.measure(CGSize(
          width: width,
          height: CGFloat(FLT_MAX)))
        height += size.height + infoConfig.verticalPadding
      }

      var rowHeight = textRowHeight()

      if rowHeight > 0 {
        height += rowHeight + infoConfig.verticalPadding
      }

      if let divider = divider {
        height += infoConfig.divider.height + infoConfig.verticalPadding
      }
    }

    return CGSizeMake(width, height)
  }

  override public func layout() {
    if let config = config {
      let infoConfig = config.catalog.header

      let padding = infoConfig.verticalPadding
      var y: CGFloat = padding

      if let titleNode = titleNode {
        let size = titleNode.calculatedSize
        titleNode.frame = CGRect(
          x: 0, y: y,
          width: width, height: size.height)
        y += size.height + padding
      }

      let rowHeight = textRowHeight()
      if rowHeight > 0 {
        if let textNode = textNode {
          let size = textNode.calculatedSize
          var rowX = (width - size.width) / CGFloat(2)

          if let iconNode = iconNode {
            let iconWidth = infoConfig.text.icon.padding
              + infoConfig.text.icon.size.width
            rowX -= iconWidth / CGFloat(2)

            let size = infoConfig.text.icon.size
            iconNode.frame = CGRect(
              x: rowX,
              y: y + (rowHeight - size.height) / CGFloat(2),
              width: size.width,
              height: size.height)

            rowX += iconWidth
          }

          textNode.frame = CGRect(
            x: rowX,
            y: y + (rowHeight - size.height) / CGFloat(2),
            width: size.width,
            height: size.height)

          y += rowHeight + padding
        }
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

  // MARK: - Private methods

  private func textRowHeight() -> CGFloat {
    var rowHeight: CGFloat = 0

    if let config = config {
      let infoConfig = config.catalog.header

      if let textNode = textNode {
        let size = textNode.measure(CGSize(
          width: width,
          height: CGFloat(FLT_MAX)))
        rowHeight = size.height
      }

      if let iconNode = iconNode {
        if infoConfig.text.icon.size.height > rowHeight {
          rowHeight = infoConfig.text.icon.size.height
        }
      }
    }

    return rowHeight
  }
}
