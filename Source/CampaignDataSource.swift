import Wall
import AsyncDisplayKit

public class CampaignDataSource: WallDataSource {}

// MARK: - ASCollectionViewDataSource

extension CampaignDataSource: ASCollectionViewDataSource {

  public override func collectionView(collectionView: ASCollectionView!, nodeForItemAtIndexPath indexPath: NSIndexPath!) -> ASCellNode! {
    let cellNode: ASCellNode

    let post = data[indexPath.row]
    let width = collectionView.frame.width

    if indexPath.row == 0 {
      cellNode = CampaignInfoCellNode(post: post, width: width, delegate)
    } else if indexPath.row == data.count - 1 {
      cellNode = CampaignReadyCellNode(post: post, width: width, delegate)
    } else {
      cellNode = PostCellNode(post: post, width: width, delegate)
    }

    return cellNode
  }
}
