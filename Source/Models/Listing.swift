import Wall

public class Listing: NSObject {

  public enum Status {
    case Open, Completed, Expired
  }

  public var title: String?
  public var publishDate: NSDate?
  public var startDate: NSDate?
  public var endDate: NSDate?
  public var status: Status?
  public var contentSections: [Post] = [ContentSection]()
  public var cardSections: [Post] = [CardSection]()

  public init(
    title: String? = nil,
    publishDate: NSDate? = nil,
    startDate: NSDate? = nil,
    endDate: NSDate? = nil,
    status: Status? = nil,
    contentSections: [ContentSection] = [],
    cardSections: [CardSection] = []) {
      self.title = title
      self.publishDate = publishDate
      self.startDate = startDate
      self.endDate = endDate
      self.status = status
      self.contentSections = contentSections
      self.cardSections = cardSections
  }
}
