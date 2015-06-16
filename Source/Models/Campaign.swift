import Wall

public class Campaign: NSObject {

  public enum Status {
    case Open, Completed, Expired
  }

  public var title: String?
  public var publishDate: NSDate?
  public var startDate: NSDate?
  public var endDate: NSDate?
  public var status: Status?
  public var contentSections = [Post]()
  public var productSections: [Post] = [ProductSection]()

  public init(
    title: String? = nil,
    publishDate: NSDate? = nil,
    startDate: NSDate? = nil,
    endDate: NSDate? = nil,
    status: Status? = nil,
    contentSections: [Post] = [],
    productSections: [ProductSection] = []) {
      self.title = title
      self.publishDate = publishDate
      self.startDate = startDate
      self.endDate = endDate
      self.status = status
      self.contentSections = contentSections
      self.productSections = productSections
  }
}
