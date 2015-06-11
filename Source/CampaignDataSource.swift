import Wall
import AsyncDisplayKit

public class CampaignDataSource: WallDataSource {


}

// MARK: - ASCollectionViewDataSource

extension CampaignDataSource: ASCollectionViewDataSource {

  public override func collectionView(collectionView: ASCollectionView!, nodeForItemAtIndexPath indexPath: NSIndexPath!) -> ASCellNode! {
    let cellNode: ASCellNode

    if let delegate = delegate as? WallController,
      post = delegate.post {
        if indexPath.row > 0 {
          cellNode = CommentCellNode(post: data[indexPath.row],
            width: collectionView.frame.width, delegate)
        } else {
          cellNode = PostCellNode(post: data[indexPath.row],
            width: collectionView.frame.width, delegate)
        }
    } else {
      cellNode = PostCellNode(post: data[indexPath.row],
        width: collectionView.frame.width, delegate)
    }

    return cellNode
  }
}
