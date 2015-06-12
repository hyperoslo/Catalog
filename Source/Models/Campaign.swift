import Wall

public class Campaign: NSObject {

  public enum Status {
    case New, Done
  }

  public var title: String
  public var publishDate: NSDate
  public var startDate: NSDate
  public var endDate: NSDate
  public var status: Status
  public var contentSections = [Post]()
  public var productSections: [Post] = [ProductSection]()

  public init(title: String, publishDate: NSDate, startDate: NSDate,
    endDate: NSDate, status: Status = Status.New,
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
