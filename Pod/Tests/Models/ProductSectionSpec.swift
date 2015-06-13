import Quick
import Nimble
import Faker
import Wall

class ProductSectionSpec: QuickSpec {

  override func spec() {
    describe("ProductSection") {
      let faker = Faker()

      let text = faker.lorem.word()
      let date = NSDate()

      var productSection: ProductSection!

      beforeEach {
        productSection = ProductSection(text: text, date: date)
      }

      describe("#init") {
        it("is a subclass of Post") {
          expect(productSection).to(beAKindOf(Post.self))
        }

        it("sets default values") {
          expect(productSection.productCards.count).to(equal(0))
        }
      }
    }
  }
}
