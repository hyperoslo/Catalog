import Quick
import Nimble
import Faker
import Wall

class CampaignReadyNodeSpec: QuickSpec {

  override func spec() {
    describe("CampaignReadyNode") {
      let faker = Faker()

      let config = Config()
      let campaign = SpecHelper.campaign
      let post = Post(
        text: faker.lorem.sentences(amount: 2),
        date: campaign.publishDate)
      let width: CGFloat = 320

      let text = NSAttributedString(
        string: post.text!,
        attributes: config.campaign.readySection.text.textAttributes)

      var node: CampaignReadyNode!

      beforeEach {
        node = CampaignReadyNode(config: config, post: post, width: width)
      }

      describe("#init") {
        it("returns a correct width") {
          expect(node.width).to(equal(width))
        }

        it("adds a text node") {
          expect(node.textNode).notTo(beNil())
          expect(node.textNode!.attributedString).to(equal(text))
          expect(node.textNode!.supernode).notTo(beNil())
          expect(node.textNode!.supernode).to(equal(node))
        }

        context("with no text") {
          beforeEach {
            post.text = nil
            node = CampaignReadyNode(config: config, post: post, width: width)
          }

          it("does not add a text node") {
            expect(node.textNode).to(beNil())
          }
        }
      }
    }
  }
}
