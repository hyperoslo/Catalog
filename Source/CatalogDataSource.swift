import Wall
import AsyncDisplayKit
import SevenSwitch

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
extension CatalogDataSource: UICollectionViewDataSource {
  public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
  
  public func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    let switchConfig = config!.catalog.footer.switchControl
    let cell: UICollectionReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: switchConfig.reuseIdentifier, forIndexPath: indexPath) as! UICollectionReusableView
    
    let campaignReadySwitch = SevenSwitch(frame: switchConfig.frame)
    campaignReadySwitch.textLabel.font = switchConfig.font
    campaignReadySwitch.knobText = switchConfig.text
    campaignReadySwitch.onTextColor = switchConfig.onTextColor
    campaignReadySwitch.offTextColor = switchConfig.offTextColor
    campaignReadySwitch.onTintColor = switchConfig.onTintColor
    campaignReadySwitch.knobMargin = switchConfig.knobMargin
    campaignReadySwitch.backgroundView.layer.borderWidth = switchConfig.backgroundBorder
    campaignReadySwitch.layoutSubviews()
    
    let center = cell.center
    campaignReadySwitch.center = center
    cell.addSubview(campaignReadySwitch)
    
    return cell as UICollectionReusableView
    //    }
}
}
