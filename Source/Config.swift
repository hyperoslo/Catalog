import Foundation
import UIKit
import Wall

public class Config: Wall.Config {

  public var campaign = Campaign()

  public override init() {
    super.init()
  }
  
  public struct Campaign {
    private static var dateFormatter: NSDateFormatter = {
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "dd.MM.yy"
      return dateFormatter
      }()

    public var padding: CGFloat = 0

    public var stringFromPostDate: (date: NSDate) -> String = {
      (date: NSDate) -> String in
      return dateFormatter.stringFromDate(date)
    }

    public struct Header {

      public struct Title {
        public var textAttributes = [
          NSFontAttributeName: UIFont.systemFontOfSize(14),
          NSForegroundColorAttributeName: UIColor.blackColor()
        ]
      }

      public struct Date {
        public var textAttributes = [
          NSFontAttributeName: UIFont.systemFontOfSize(10),
          NSForegroundColorAttributeName: UIColor.grayColor()
        ]
      }
    }

    public struct ContentSection {
      public var horizontalPadding: CGFloat = 0
      public var verticalPadding: CGFloat = 10

      public struct Title {
        public var textAttributes = [
          NSFontAttributeName: UIFont.boldSystemFontOfSize(14),
          NSForegroundColorAttributeName: UIColor.blackColor()
        ]
      }
    }

    public struct ProductSection {
      public var horizontalPadding: CGFloat = 0
      public var verticalPadding: CGFloat = 10

      public struct Title {
        public var textAttributes = [
          NSFontAttributeName: UIFont.boldSystemFontOfSize(14),
          NSForegroundColorAttributeName: UIColor.blackColor()
        ]
      }
    }
  }
}
