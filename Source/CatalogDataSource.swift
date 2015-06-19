import Wall
import AsyncDisplayKit

public class CatalogDataSource: WallDataSource {}

// MARK: - ASCollectionViewDataSource

extension CatalogDataSource: ASCollectionViewDataSource {

  public override func collectionView(collectionView: ASCollectionView!, nodeForItemAtIndexPath indexPath: NSIndexPath!) -> ASCellNode! {
    let cellNode: ASCellNode

    let post = data[indexPath.row]
    let width = collectionView.frame.width

    if indexPath.row == 0 {
      cellNode = HeaderCellNode(post: post, width: width, delegate)
    } else if indexPath.row == data.count - 1 {
      cellNode = FooterCellNode(post: post, width: width, delegate)
    } else {
      cellNode = CampaignCellNode(post: post, width: width, delegate)
    }

    return cellNode
  }
}
