import UIKit
import Wall
import Campaign

class ViewController: CampaignController {

  let generator = ContentGenerator()

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Campaign Ready"

    config.wall.thumbnailForAttachment = {
      (attachment: Attachment, size: CGSize) -> URLStringConvertible in
      return String(format: attachment.thumbnail.string, Int(size.width), Int(size.height))
    }

    campaign = generator.campaign()
    reloadPosts()
  }
}
