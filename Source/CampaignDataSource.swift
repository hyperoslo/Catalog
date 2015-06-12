import Wall
import AsyncDisplayKit

public class CampaignDataSource: WallDataSource {


}

// MARK: - ASCollectionViewDataSource

extension CampaignDataSource: ASCollectionViewDataSource {

  public override func collectionView(collectionView: ASCollectionView!, nodeForItemAtIndexPath indexPath: NSIndexPath!) -> ASCellNode! {
    let cellNode: ASCellNode

    cellNode = ASCellNode()

    return cellNode
  }
}
