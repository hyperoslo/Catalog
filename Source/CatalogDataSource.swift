import Wall
import AsyncDisplayKit

public class CatalogDataSource: WallDataSource {

  var config: Config?

  public convenience init(delegate: AnyObject?, config: Config) {
    self.init()

    self.delegate = delegate
    self.config = config
  }
}

// MARK: - ASCollectionViewDataSource

extension CatalogDataSource: ASCollectionViewDataSource {

  public override func collectionView(collectionView: ASCollectionView!, nodeForItemAtIndexPath indexPath: NSIndexPath!) -> ASCellNode! {
    let cellNode: ASCellNode

    let post = data[indexPath.row]
    let width = collectionView.frame.width

    if indexPath.row == 0 {
      cellNode = config != nil && config!.catalog.header.enabled
        ? HeaderCellNode(post: post, width: width, delegate)
        : SectionCellNode(post: post, width: width, delegate)
    } else if indexPath.row == data.count - 1 {
      cellNode = config != nil && config!.catalog.footer.enabled
        ? FooterCellNode(post: post, width: width, delegate)
        : SectionCellNode(post: post, width: width, delegate)
    } else {
      cellNode = SectionCellNode(post: post, width: width, delegate)
    }

    return cellNode
  }
}
