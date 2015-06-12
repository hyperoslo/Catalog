import Foundation
import UIKit
import Wall

public class Config: Wall.Config {

  public var campaign = Campaign()

  public override init() {
    super.init()
  }

  public struct Campaign {
    public var dateFormatter: NSDateFormatter = {
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "dd.MM.yy"
      return dateFormatter
      }()

    public var padding: CGFloat = 0

    public var header = Header()

    public struct Header {
      public var padding: CGFloat = 5

      public var title = Title()
      public var date = Date()

      public struct Title {
        public var textAttributes = [
          NSFontAttributeName: UIFont.systemFontOfSize(14),
          NSForegroundColorAttributeName: UIColor.blackColor(),
          NSParagraphStyleAttributeName: {
            var style = NSMutableParagraphStyle()
            style.alignment = .Center
            return style
            }()
        ]
      }

      public struct Date {
        public var textAttributes = [
          NSFontAttributeName: UIFont.systemFontOfSize(10),
          NSForegroundColorAttributeName: UIColor.grayColor(),
          NSParagraphStyleAttributeName: {
            var style = NSMutableParagraphStyle()
            style.alignment = .Center
            return style
            }()
        ]
      }
    }
  }
}
