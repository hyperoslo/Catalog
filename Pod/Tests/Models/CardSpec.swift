import Quick
import Nimble
import Faker
import Wall

class CardSpec: QuickSpec {

  override func spec() {
    describe("Card") {
      let faker = Faker()

      let item = SpecHelper.item
      let relatedItems = [SpecHelper.item]

      var card: Card!

      beforeEach {
        card = Card(item: item, relatedItems: relatedItems)
      }

      describe("#init") {
        it("sets item") {
          expect(card.item).to(equal(item))
        }

        it("sets related items") {
          expect(card.relatedItems.count).to(equal(1))
        }

        context("with required parameters") {
          beforeEach {
            card = Card(item: item)
          }

          it("sets default values") {
            expect(card.relatedItems.count).to(equal(0))
          }
        }
      }
    }
  }
}
