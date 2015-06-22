import Wall

public class Item: NSObject {

  public var title: String?
  public var attachments: [Attachment]?
  public var serialNumber: String?
  public var text: String?
  public var price: Double?
  public var oldPrice: Double?
  public var discount: String?

  public init(
    title: String? = nil,
    serialNumber: String? = nil,
    attachments: [Attachment]? = nil,
    price: Double? = nil,
    oldPrice: Double? = nil,
    discount: String? = nil) {
      self.title = title
      self.serialNumber = serialNumber
      self.attachments = attachments
      self.price = price
      self.oldPrice = price
      self.discount = discount
  }
}
