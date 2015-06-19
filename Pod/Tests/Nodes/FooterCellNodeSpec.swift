import Quick
import Nimble
import Faker
import Wall

class FooterCellNodeSpec: QuickSpec {

  override func spec() {
    describe("FooterCellNode") {
      let faker = Faker()

      let controller = CatalogController()
      let config = controller.catalogConfig.catalog

      let category = SpecHelper.category
      let post = Post(
        text: faker.lorem.sentences(amount: 2),
        date: category.publishDate)
      let width: CGFloat = 320

      let text = NSAttributedString(
        string: post.text!,
        attributes: config.footer.text.textAttributes)

      var node: FooterCellNode!

      beforeEach {
        node = FooterCellNode(post: post, width: width, controller)
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
            node = FooterCellNode(post: post, width: width, controller)
          }

          it("does not add a text node") {
            expect(node.textNode).to(beNil())
          }
        }
      }
    }
  }
}
