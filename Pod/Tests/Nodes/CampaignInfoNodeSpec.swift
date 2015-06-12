import Quick
import Nimble
import Faker
import Wall

class CampaignInfoNodeSpec: QuickSpec {

  override func spec() {
    describe("CampaignInfoNode") {
      let faker = Faker()

      let config = Config()
      let campaign = SpecHelper.campaign
      let post = Post(
        text: faker.lorem.sentences(amount: 2),
        date: campaign.publishDate)
      post.title = faker.lorem.word()
      let width: CGFloat = 320

      let title = NSAttributedString(
        string: post.title!,
        attributes: config.campaign.info.title.textAttributes)
      let text = NSAttributedString(
        string: post.text!,
        attributes: config.campaign.info.text.textAttributes)

      var node: CampaignInfoNode!

      beforeEach {
        node = CampaignInfoNode(config: config, post: post, width: width)
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
            node = CampaignInfoNode(config: config, post: post, width: width)
          }

          it("does not add a title node") {
            expect(node.titleNode).to(beNil())
          }
        }

        context("with no text") {
          beforeEach {
            post.text = nil
            node = CampaignInfoNode(config: config, post: post, width: width)
          }

          it("does not add a text node") {
            expect(node.textNode).to(beNil())
          }
        }
      }
    }
  }
}
