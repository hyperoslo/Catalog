import Foundation

public class Campaign: NSObject {

  public enum Status {
    case New, Done
  }

  public var id: Int?
  public var title: String
  public var startDate: NSDate
  public var endDate: NSDate
  public var status: Status

  public init(title: String, startDate: NSDate, endDate: NSDate,
    status: Status = Status.New) {
      self.title = title
      self.startDate = startDate
      self.endDate = endDate
      self.status = status
  }
}
