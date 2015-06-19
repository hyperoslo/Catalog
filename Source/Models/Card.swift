import Foundation

public class Card: NSObject {

  public var item: Item?
  public var relatedItems = [Item]()

  public init(item: Item? = nil, relatedItems: [Item] = []) {
    self.item = item
    self.relatedItems = relatedItems
  }
}
