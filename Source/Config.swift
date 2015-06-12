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

    public var info = Info()
    public var readySection = ReadySection()

    public struct Info {
      public var verticalPadding: CGFloat = 10
      public var title = Title()
      public var text = Text()

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

      public struct Text {
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

    public struct ReadySection {
      public var verticalPadding: CGFloat = 10
      public var text = Text()

      public struct Text {
        public var infoText = NSLocalizedString("ReadyInfo", comment: "")
        public var textAttributes = [
          NSFontAttributeName: UIFont.systemFontOfSize(14),
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
