import Quick
import Nimble
import Faker
import Wall

class CampaignInfoCellNodeSpec: QuickSpec {

  override func spec() {
    describe("CampaignInfoCellNode") {
      let faker = Faker()

      let controller = CampaignController()
      let config = controller.campaignConfig.campaign
      let campaign = SpecHelper.campaign
      let post = Post(
        text: faker.lorem.sentences(amount: 2),
        date: campaign.publishDate)
      post.title = faker.lorem.word()
      let width: CGFloat = 320

      let title = NSAttributedString(
        string: post.title!,
        attributes: config.info.title.textAttributes)
      let text = NSAttributedString(
        string: post.text!,
        attributes: config.info.text.textAttributes)

      var node: CampaignInfoCellNode!

      beforeEach {
        node = CampaignInfoCellNode(post: post, width: width, controller)
      }

      describe("#init") {
        it("returns a correct width") {
          expect(node.width).to(equal(width))
        }

        it("adds a title node") {
          expect(node.titleNode).notTo(beNil())
          expect(node.titleNode!.attributedString).to(equal(title))
          expect(node.titleNode!.supernode).notTo(beNil())
          expect(node.titleNode!.supernode).to(equal(node))
        }

        it("adds a text node") {
          expect(node.textNode).notTo(beNil())
          expect(node.textNode!.attributedString).to(equal(text))
          expect(node.textNode!.supernode).notTo(beNil())
          expect(node.textNode!.supernode).to(equal(node))
        }

        context("with no title") {
          beforeEach {
            post.title = nil
            node = CampaignInfoCellNode(post: post, width: width, controller)
          }

          it("does not add a title node") {
            expect(node.titleNode).to(beNil())
          }
        }

        context("with no text") {
          beforeEach {
            post.text = nil
            node = CampaignInfoCellNode(post: post, width: width, controller)
          }

          it("does not add a text node") {
            expect(node.textNode).to(beNil())
          }
        }
      }
    }
  }
}
